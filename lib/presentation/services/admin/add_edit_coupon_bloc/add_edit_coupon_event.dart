part of 'add_edit_coupon_bloc.dart';

abstract class AddEditCouponEvent extends Equatable {
  const AddEditCouponEvent();

  @override
  List<Object> get props => [];
}

class ButtonAddCouponPressed extends AddEditCouponEvent {
  final Coupon coupon;

  const ButtonAddCouponPressed({required this.coupon});

  @override
  List<Object> get props => [coupon];
}
