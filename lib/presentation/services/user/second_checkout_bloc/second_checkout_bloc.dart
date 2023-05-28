import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'second_checkout_event.dart';
part 'second_checkout_state.dart';

class SecondCheckoutBloc
    extends Bloc<SecondCheckoutEvent, SecondCheckoutState> {
  SecondCheckoutBloc() : super(SecondCheckoutInitial()) {
    on<SecondCheckoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
