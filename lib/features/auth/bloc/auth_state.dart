part of 'auth_bloc.dart';

enum AuthScreen { unknown, home, failure }

class AuthState extends BaseState {
  const AuthState({
    required super.status,
    this.screen = AuthScreen.unknown,
    this.email,
    this.password,
    this.memoryPinCode,
    this.createdPinCode,
    this.needCheckEmail = false,
    this.isObscured = true,
    this.needCheckCorrectPassword = false,
    required this.shouldInit,
  });

  final bool needCheckEmail;
  final bool isObscured;
  final bool needCheckCorrectPassword;
  final AuthScreen screen;
  final String? email;
  final String? password;
  final String? memoryPinCode;
  final String? createdPinCode;
  final bool shouldInit;

  @override
  AuthState copyWith({
    BaseStatus? status,
    AuthScreen? screen,
    String? username,
    String? email,
    String? password,
    String? memoryPinCode,
    String? createdPinCode,
    bool? shouldInit,
    bool? needCheckEmail,
    bool? needCheckCorrectPassword,
    bool? isObscured,
  }) =>
      AuthState(
        status: status ?? this.status,
        screen: screen ?? this.screen,
        email: email ?? this.email,
        password: password ?? this.password,
        memoryPinCode: memoryPinCode ?? this.memoryPinCode,
        createdPinCode: createdPinCode ?? this.createdPinCode,
        shouldInit: shouldInit ?? this.shouldInit,
        needCheckEmail: needCheckEmail ?? this.needCheckEmail,
        needCheckCorrectPassword: needCheckCorrectPassword ?? this.needCheckCorrectPassword,
        isObscured: isObscured ?? this.isObscured,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        screen,
        email,
        password,
        memoryPinCode,
        createdPinCode,
        shouldInit,
        needCheckEmail,
        needCheckCorrectPassword,
        isObscured,
      ];
}
