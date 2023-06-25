part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionFailure extends TransactionState {
  final String errorMessage;

  const TransactionFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class TransactionSuccess extends TransactionState {
  final List<Order> orders;

  const TransactionSuccess({required this.orders});

  @override
  List<Object> get props => [orders];
}
