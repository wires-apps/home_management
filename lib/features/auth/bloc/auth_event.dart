part of 'auth_bloc.dart';

abstract class AuthEvent extends BaseEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginValidateField extends AuthEvent {}

class LoginInitDevice extends AuthEvent {}

class LoginEmailChanged extends AuthEvent {}

class LoginPasswordChanged extends AuthEvent {}

class LoginTogglePasswordVisibility extends AuthEvent {}
class CheckSessionToken extends AuthEvent {}
