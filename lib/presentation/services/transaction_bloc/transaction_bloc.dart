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
    on<TransactionSorted>(_onSorted);
    on<TransactionFiltered>(_onFiltered);
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

  FutureOr<void> _onSorted(
      TransactionSorted event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());

    try {
      if (event.sortValue == 'Nearest Date') {
        orders.sort((order1, order2) {
          DateTime tmp1, tmp2;

          tmp1 = DateTime.parse(order1.createdAt!);
          tmp2 = DateTime.parse(order2.createdAt!);

          return tmp2.compareTo(tmp1);
        });
      } else {
        orders.sort((order1, order2) {
          DateTime tmp1, tmp2;

          tmp1 = DateTime.parse(order1.createdAt!);
          tmp2 = DateTime.parse(order2.createdAt!);

          return tmp1.compareTo(tmp2);
        });
      }
      emit(TransactionSuccess(orders: [...orders]));
    } catch (e) {
      emit(TransactionFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onFiltered(
      TransactionFiltered event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());

    try {
      emit(TransactionSuccess(orders: [...orders]));
    } catch (e) {
      emit(TransactionFailure(errorMessage: e.toString()));
    }
  }
}
