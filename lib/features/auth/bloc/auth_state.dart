part of 'auth_bloc.dart';

enum AuthScreen { unknown, home, failure, sms, }

class AuthState extends BaseState {
  const AuthState({
    required super.status,
    super.dialogInfo,
    this.screen = AuthScreen.unknown,
    this.email,
    this.password,
    this.device,
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
  final String? device;
  final String? memoryPinCode;
  final String? createdPinCode;
  final bool shouldInit;

  @override
  AuthState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    AuthScreen? screen,
    String? username,
    String? email,
    String? password,
    String? device,
    String? memoryPinCode,
    String? createdPinCode,
    bool? shouldInit,
    bool? needCheckEmail,
    bool? needCheckCorrectPassword,
    bool? isObscured,
  }) =>
      AuthState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        screen: screen ?? this.screen,
        email: email ?? this.email,
        password: password ?? this.password,
        device: device ?? this.device,
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
        device,
        memoryPinCode,
        createdPinCode,
        shouldInit,
        needCheckEmail,
        needCheckCorrectPassword,
        isObscured,
      ];
}
