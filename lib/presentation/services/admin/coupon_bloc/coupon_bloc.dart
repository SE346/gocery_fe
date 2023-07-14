import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/coupon.dart';
import 'package:grocery/data/repository/coupon_repository.dart';

part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  final CouponRepository _couponRepository;

  List<Coupon> coupons = [];

  CouponBloc(this._couponRepository) : super(CouponInitial()) {
    on<CouponStarted>(_onStarted);
    on<CouponAdded>(_onAdded);
  }

  FutureOr<void> _onStarted(
      CouponStarted event, Emitter<CouponState> emit) async {
    emit(CouponLoading());

    try {
      List<Coupon> result = await _couponRepository.getAllCoupons();
      coupons = result;
      emit(CouponSuccess(coupons: [...coupons]));
    } catch (e) {
      emit(CouponFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onAdded(CouponAdded event, Emitter<CouponState> emit) async {
    coupons.add(event.coupon);
    emit(CouponSuccess(coupons: [...coupons]));
  }
}
