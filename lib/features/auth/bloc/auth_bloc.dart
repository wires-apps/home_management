import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/auth/models/sign_in_request_dto.dart';
import 'package:home_management/features/auth/repository/auth_remote_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(this._repository)
      : super(const AuthState(
          status: BaseStatus.loading,
          screen: AuthScreen.unknown,
          shouldInit: false,
        )) {
    on<LoginEmailChanged>(_onChangeEmail);
    on<LoginPasswordChanged>(_onChangePhoneNumber);
    on<LoginValidateField>(_onValidField);
    on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
    on<LoginInitDevice>(_addedDeviceInfo);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final AuthRemoteRepository _repository;

  ///TODO added when backend will be ready
  // final maskFormatter = MaskTextInputFormatter(
  //   mask: '+7 (###) ###-##-##',
  //   filter: {"#": RegExp(r'[0-9]')},
  // );

  void _onChangeEmail(
    LoginEmailChanged event,
    Emitter<AuthState> emit,
  ) =>
      emit(
        state.copyWith(
          status: BaseStatus.success,
          needCheckEmail: false,
        ),
      );

  Future _addedDeviceInfo(
    LoginInitDevice event,
    Emitter<AuthState> emit,
  ) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String device = '';
    deviceInfo.deviceInfo;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device = 'Android ${androidInfo.model}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device = 'iOS ${iosInfo.model}';
    }
    emit(
      state.copyWith(
        status: BaseStatus.success,
        device: device,
      ),
    );
  }

  void _onChangeObscuredPassword(
    LoginTogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        status: BaseStatus.success,
        isObscured: !state.isObscured,
      ),
    );
  }

  void _onChangePhoneNumber(
    LoginPasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    return emit(
      state.copyWith(
        status: BaseStatus.success,
        needCheckCorrectPassword: false,
      ),
    );
  }

  Future _onValidField(
    LoginValidateField event,
    Emitter<AuthState> emit,
  ) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty || phoneController.text.isEmpty) {
      emit(
        state.copyWith(
          status: BaseStatus.success,
          needCheckEmail: true,
          needCheckCorrectPassword: true,
        ),
      );
    } else {
      final request = await _repository.logIn(
        SignInRequestDto(
          personalAccount: emailController.text,
          password: passwordController.text,
          device: state.device ?? '',
          phoneNumber: phoneController.text,
        ),
      );
      request.fold(
        (failure) {
          emit(
            state.copyWith(
              status: BaseStatus.failure,
              screen: AuthScreen.unknown,
              dialogInfo: SnackBarInfo.getErrorMessage(failure),
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              status: BaseStatus.success,
              screen: AuthScreen.sms,
            ),
          );
        },
      );
    }
  }
}
