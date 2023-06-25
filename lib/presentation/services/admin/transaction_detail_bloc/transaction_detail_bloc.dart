import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/repository/order_repository.dart';

part 'transaction_detail_event.dart';
part 'transaction_detail_state.dart';

class TransactionDetailBloc
    extends Bloc<TransactionDetailEvent, TransactionDetailState> {
  final OrderRepository _orderRepository;

  TransactionDetailBloc(this._orderRepository)
      : super(TransactionDetailInitial()) {
    on<TransactionDetailStatusChanged>(_onStatusChanged);
  }

  FutureOr<void> _onStatusChanged(TransactionDetailStatusChanged event,
      Emitter<TransactionDetailState> emit) async {
    emit(TransactionDetailLoading());

    try {
      await _orderRepository.updateStatus(event.orderId, event.newStatus);
      emit(const TransactionDetailSuccess());
    } catch (e) {
      emit(TransactionDetailFailure(errorMessage: e.toString()));
    }
  }
}
