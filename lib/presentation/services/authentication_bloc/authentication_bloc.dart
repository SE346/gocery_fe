import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/repository/auth_repository.dart';
import 'package:grocery/presentation/services/app_data.dart';
import 'package:grocery/presentation/services/authentication_bloc/authentication_event.dart';
import 'package:grocery/presentation/services/authentication_bloc/authentication_state.dart';
import 'package:grocery/presentation/utils/functions.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;

  AuthenticationBloc(
    this._authRepository,
  ) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});

    on<RegistrationButtonPressed>((event, emit) async {
      emit(RegistrationLoading());

      try {
        final result = await _authRepository.register(event.user);

        if (result!.statusCode == 201) {
          emit(RegistrationSuccess());
        } else {
          emit(RegistrationFailure(error: result.message!));
        }
      } catch (e) {
        emit(RegistrationFailure(error: e.toString()));
      }
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        final result = await _authRepository.login(event.email, event.password);

        if (result!.statusCode == 201) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: result.message!));
        }
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });

    on<InitRegistration>((event, emit) => emit(RegistrationInitial()));
    on<InitLogin>((event, emit) => emit(LoginInitial()));
  }
}
