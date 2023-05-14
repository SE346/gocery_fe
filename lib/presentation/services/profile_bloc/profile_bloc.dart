import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/data/repository/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository _authRepository;

  ProfileBloc(this._authRepository) : super(ProfileInitial()) {
    on<ProfileLoggedOut>(_onLoggedOut);
  }

  void _onLoggedOut(event, emit) async {
    emit(ProfileLoading());

    try {
      _authRepository.logout();
      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }
}
