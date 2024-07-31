part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class EmailChnage extends AuthEvent {
  final String email;

  const EmailChnage({required this.email});
  @override
  List<Object?> get props => [email];
}

class PasswordChange extends AuthEvent {
  final String password;

  const PasswordChange({required this.password});
  @override
  List<Object?> get props => [password];
}

class LoginEvent extends AuthEvent {}
