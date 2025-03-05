import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(const AuthState(
          status: BaseStatus.loading,
          screen: AuthScreen.unknown,
          shouldInit: false,
        )) {
    on<LoginEmailChanged>(_onChangeEmail);
    on<LoginPasswordChanged>(_onChangePhoneNumber);
    on<LoginValidateField>(_onValidField);
    on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  // MaskedTextController phoneController =
  // MaskedTextController(mask: '+7 (000) 000-00-00');
  void _onChangeEmail(
    LoginEmailChanged event,
    Emitter<AuthState> emit,
  ) =>
      emit(
        state.copyWith(
          needCheckEmail: false,
        ),
      );

  void _onChangeObscuredPassword(
    LoginTogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) =>
      emit(state.copyWith(isObscured: !state.isObscured));

  void _onChangePhoneNumber(
    LoginPasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    return emit(
      state.copyWith(
        needCheckCorrectPassword: false,
      ),
    );
  }

  void _onValidField(
    LoginValidateField event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        needCheckEmail: true,
        needCheckCorrectPassword: true,
      ),
    );
  }
}
