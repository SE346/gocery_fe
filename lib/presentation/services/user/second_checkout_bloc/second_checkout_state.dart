part of 'second_checkout_bloc.dart';

abstract class SecondCheckoutState extends Equatable {
  const SecondCheckoutState();

  @override
  List<Object> get props => [];
}

class SecondCheckoutInitial extends SecondCheckoutState {}

class SecondCheckoutLoading extends SecondCheckoutState {}

class SecondCheckoutSuccess extends SecondCheckoutState {
  final Address currentAddress;
  final List<Cart> carts;

  const SecondCheckoutSuccess({
    required this.currentAddress,
    required this.carts,
  });

  @override
  List<Object> get props => [currentAddress, carts];
}

class OrderSuccess extends SecondCheckoutState {
  final String name;

  const OrderSuccess({required this.name});

  @override
  List<Object> get props => [name];
}

class SecondCheckoutFailure extends SecondCheckoutState {
  final String errorMessage;

  const SecondCheckoutFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
