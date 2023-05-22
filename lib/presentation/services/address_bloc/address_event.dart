part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class AddressStarted extends AddressEvent {}

class NewAddressAdded extends AddressEvent {
  final Address address;

  const NewAddressAdded({required this.address});

  @override
  List<Object> get props => [address];
}
