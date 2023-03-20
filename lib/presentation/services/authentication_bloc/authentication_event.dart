import 'package:equatable/equatable.dart';
import 'package:grocery/data/models/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// [REGISTER EVENT]
class InitRegistration extends AuthenticationEvent {}

class RegistrationButtonPressed extends AuthenticationEvent {
  final User user;
  const RegistrationButtonPressed({required this.user});
  @override
  List<Object> get props => [user];
}

// [LOGIN EVENT]
class InitLogin extends AuthenticationEvent {}

class LoginButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
