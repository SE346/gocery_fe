import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/data/models/cart.dart';
import 'package:grocery/data/models/data.dart';
import 'package:grocery/data/models/notification_request.dart';
import 'package:grocery/data/models/order.dart';
import 'package:grocery/data/repository/address_repository.dart';
import 'package:grocery/data/repository/cart_repository.dart';
import 'package:grocery/data/repository/order_repository.dart';
import 'package:grocery/data/repository/zalo_pay_repository.dart';
import 'package:grocery/data/services/firebase_service.dart';

part 'second_checkout_event.dart';
part 'second_checkout_state.dart';

class SecondCheckoutBloc
    extends Bloc<SecondCheckoutEvent, SecondCheckoutState> {
  final AddressRepository _addressRepository;
  final OrderRepository _orderRepository;
  final CartRepository _cartRepository;
  final ZaloPayRepository _zaloPayRepository;

  late Address currentAddress;
  List<Cart> carts = [];

  SecondCheckoutBloc(
    this._addressRepository,
    this._orderRepository,
    this._cartRepository,
    this._zaloPayRepository,
  ) : super(SecondCheckoutInitial()) {
    on<SecondCheckoutStarted>(_onStarted);
    on<CheckoutSubmitted>(_onSubmitted);
    on<NewAddressChosen>(_onNewAddressChosen);
  }

  FutureOr<void> _onStarted(
      SecondCheckoutStarted event, Emitter<SecondCheckoutState> emit) async {
    emit(SecondCheckoutLoading());
    try {
      List<Address> addresses = await _addressRepository.getAddresses();
      for (var address in addresses) {
        if (address.setAsPrimary) {
          currentAddress = address;
          break;
        }
      }
      List<Cart>? result = await _cartRepository.getAllCarts();
      carts = result ?? [];
      emit(SecondCheckoutSuccess(currentAddress: currentAddress, carts: carts));
    } catch (e) {
      emit(SecondCheckoutFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onSubmitted(
      CheckoutSubmitted event, Emitter<SecondCheckoutState> emit) async {
    emit(SecondCheckoutLoading());
    try {
      if (event.order.paymentMethod == 'Zalopay') {
        final result = await _zaloPayRepository.createOrder(event.order.total!);
        if (result != null) {
          print(result.returnmessage);

          await const MethodChannel('flutter.native/channelPayOrder')
              .invokeMethod('payOrder', {"zptoken": result.zptranstoken});
        }
      }
      if (event.isFromCart) {
        await _orderRepository.createOrderFromCart(event.order);
      } else {
        await _orderRepository.createOrder(event.order);
      }

      await sendNotification();

      emit(OrderSuccess(name: currentAddress.name));
    } catch (e) {
      emit(SecondCheckoutFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onNewAddressChosen(
      NewAddressChosen event, Emitter<SecondCheckoutState> emit) {
    emit(SecondCheckoutSuccess(currentAddress: event.newAddress, carts: carts));
  }

  Future<void> sendNotification() async {
    FirebaseService firebaseService = FirebaseService();

    Data data = Data(
      title: 'Gocery Application',
      body: '${currentAddress.name} has created an order',
    );

    String? fcmAdminToken =
        await firebaseService.getFCMToken('20522122@gm.uit.edu.vn');

    log('token: $fcmAdminToken');

    NotificationRequest notificationRequest = NotificationRequest(
      data: data,
      to: fcmAdminToken!,
    );

    await firebaseService.sendNotification(notificationRequest);
  }
}
