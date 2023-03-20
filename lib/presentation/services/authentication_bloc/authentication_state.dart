import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

// [LOGIN STATE]
class LoginFailure extends AuthenticationState {
  final String error;
  const LoginFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class LoginInitial extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginLoading extends AuthenticationState {}

// [REGISTRATION STATE]
class RegistrationFailure extends AuthenticationState {
  final String error;
  const RegistrationFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class RegistrationInitial extends AuthenticationState {}

class RegistrationSuccess extends AuthenticationState {}

class RegistrationLoading extends AuthenticationState {}
