part of 'auth_bloc.dart';

enum AuthScreen {
  logIn,
  home,
  sms,
  unknown,
}

class AuthState extends BaseState {
  const AuthState({
    required super.status,
    super.dialogInfo,
    this.screen = AuthScreen.unknown,
    this.device,
    this.needCheckEmail = false,
    this.isObscured = true,
    this.needCheckCorrectPassword = false,
    this.model,
  });

  final bool needCheckEmail;
  final bool isObscured;
  final bool needCheckCorrectPassword;
  final AuthScreen screen;
  final String? device;
  final SignInResponseDto? model;

  @override
  AuthState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    AuthScreen? screen,
    String? device,
    bool? needCheckEmail,
    bool? needCheckCorrectPassword,
    bool? isObscured,
    SignInResponseDto? model,
  }) =>
      AuthState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        screen: screen ?? this.screen,
        device: device ?? this.device,
        needCheckEmail: needCheckEmail ?? this.needCheckEmail,
        needCheckCorrectPassword: needCheckCorrectPassword ?? this.needCheckCorrectPassword,
        isObscured: isObscured ?? this.isObscured,
        model: model ?? this.model,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        screen,
        device,
        needCheckEmail,
        needCheckCorrectPassword,
        isObscured,
        model,
      ];
}
