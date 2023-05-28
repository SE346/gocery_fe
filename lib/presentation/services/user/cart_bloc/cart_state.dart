part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> carts;
  const CartLoaded({required this.carts});

  @override
  List<Object> get props => [carts];
}

class CartFailure extends CartState {
  final String errorMessage;

  const CartFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
