part of 'coupon_bloc.dart';

abstract class CouponEvent extends Equatable {
  const CouponEvent();

  @override
  List<Object> get props => [];
}

class CouponStarted extends CouponEvent {}

class CouponAdded extends CouponEvent {
  final Coupon coupon;
  const CouponAdded({required this.coupon});
  @override
  List<Object> get props => [coupon];
}
