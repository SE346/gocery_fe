import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/coupon.dart';

part 'add_edit_coupon_event.dart';
part 'add_edit_coupon_state.dart';

class AddEditCouponBloc extends Bloc<AddEditCouponEvent, AddEditCouponState> {
  AddEditCouponBloc() : super(AddEditCouponInitial()) {
    on<AddEditCouponEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
