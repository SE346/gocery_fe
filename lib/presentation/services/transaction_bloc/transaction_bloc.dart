import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/order.dart';
import 'package:grocery/data/repository/order_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final OrderRepository _orderRepository;

  List<Order> orders = [];

  TransactionBloc(this._orderRepository) : super(TransactionInitial()) {
    on<TransactionEvent>(_onStarted);
  }

  FutureOr<void> _onStarted(
      TransactionEvent event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());

    try {
      List<Order> result = await _orderRepository.getAllOrders();
      orders = result;
      emit(TransactionSuccess(orders: [...orders]));
    } catch (e) {
      emit(TransactionFailure(errorMessage: e.toString()));
    }
  }
}
