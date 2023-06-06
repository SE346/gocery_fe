// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'second_checkout_bloc.dart';

abstract class SecondCheckoutEvent extends Equatable {
  const SecondCheckoutEvent();

  @override
  List<Object> get props => [];
}

class SecondCheckoutStarted extends SecondCheckoutEvent {}

class CheckoutSubmitted extends SecondCheckoutEvent {
  final Order order;
  const CheckoutSubmitted({required this.order});

  @override
  List<Object> get props => [order];
}

class NewAddressChosen extends SecondCheckoutEvent {
  final Address newAddress;

  const NewAddressChosen({required this.newAddress});

  @override
  List<Object> get props => [newAddress];
}
