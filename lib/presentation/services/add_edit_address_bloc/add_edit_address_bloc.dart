import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/data/models/place.dart';
import 'package:grocery/data/repository/address_repository.dart';

part 'add_edit_address_event.dart';
part 'add_edit_address_state.dart';

class AddEditAddressBloc
    extends Bloc<AddEditAddressEvent, AddEditAddressState> {
  final AddressRepository _addressRepository;

  List<Place> provinces = [];
  List<Place> wards = [];
  List<Place> districts = [];
  Place? currentProvince, currentDistrict, currentWard;

  AddEditAddressBloc(this._addressRepository) : super(AddEditAddressInitial()) {
    on<ProvincesFetched>(_onProvincesFetched);
    on<DistrictsFetched>(_onDistrictsFetched);
    on<WardsFetched>(_onWardsFetched);
    on<AddressSaved>(_onSaved);
    on<AddEditAddressStarted>(_onStarted);
  }

  FutureOr<void> _onProvincesFetched(
      ProvincesFetched event, Emitter<AddEditAddressState> emit) async {
    provinces = await _addressRepository.getProvinces();

    if (event.name != null) {
      for (var province in provinces) {
        if (province.name == event.name) {
          currentProvince = province;
          break;
        }
      }
    }

    emit(AddressFetchedSuccess(
      provinces: provinces,
      wards: wards,
      districts: districts,
      currentProvince: currentProvince,
      currentWard: currentWard,
      currentDistrict: currentDistrict,
    ));
  }

  FutureOr<void> _onDistrictsFetched(
      DistrictsFetched event, Emitter<AddEditAddressState> emit) async {
    districts = await _addressRepository.getDistricts(event.code);

    if (event.name != null) {
      for (var district in districts) {
        if (district.name == event.name) {
          currentDistrict = district;
          break;
        }
      }
    }

    emit(AddressFetchedSuccess(
      provinces: provinces,
      wards: wards,
      districts: districts,
      currentProvince: currentProvince,
      currentWard: currentWard,
      currentDistrict: currentDistrict,
    ));
  }

  FutureOr<void> _onWardsFetched(
      WardsFetched event, Emitter<AddEditAddressState> emit) async {
    wards = await _addressRepository.getWards(event.code);

    if (event.name != null) {
      for (var ward in wards) {
        if (ward.name == event.name) {
          currentWard = ward;
          break;
        }
      }
    }

    emit(AddressFetchedSuccess(
      provinces: provinces,
      wards: wards,
      districts: districts,
      currentProvince: currentProvince,
      currentWard: currentWard,
      currentDistrict: currentDistrict,
    ));
  }

  FutureOr<void> _onSaved(
      AddressSaved event, Emitter<AddEditAddressState> emit) async {
    emit(AddEditAddressLoading());

    try {
      Address? address =
          await _addressRepository.createNewAddress(event.address);
      emit(AddEditAddressSuccess(newAddress: address!));
    } catch (e) {
      emit(AddEditAddressFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onStarted(
      AddEditAddressStarted event, Emitter<AddEditAddressState> emit) {
    if (event.currentAddress == null) {
      currentDistrict = null;
      currentProvince = null;
      currentWard = null;
      wards = [];
      provinces = [];
      districts = [];

      emit(AddAddressMode());
    } else {
      currentDistrict = null;
      currentProvince = null;
      currentWard = null;
      wards = [];
      provinces = [];
      districts = [];

      emit(EditAddressMode(currentAddress: event.currentAddress!));
    }
  }
}
