part of 'add_edit_address_bloc.dart';

abstract class AddEditAddressEvent extends Equatable {
  const AddEditAddressEvent();

  @override
  List<Object> get props => [];
}

class AddEditAddressStarted extends AddEditAddressEvent {
  final Address? currentAddress;

  const AddEditAddressStarted(this.currentAddress);
}

class ProvincesFetched extends AddEditAddressEvent {
  final String? name;

  const ProvincesFetched(this.name);
}

class DistrictsFetched extends AddEditAddressEvent {
  final int code;
  final String? name;

  const DistrictsFetched({
    required this.code,
    this.name,
  });

  @override
  List<Object> get props => [code];
}

class WardsFetched extends AddEditAddressEvent {
  final int code;
  final String? name;

  const WardsFetched({
    required this.code,
    this.name,
  });

  @override
  List<Object> get props => [code];
}

class AddressSaved extends AddEditAddressEvent {
  final Address address;

  const AddressSaved({required this.address});

  @override
  List<Object> get props => [address];
}
