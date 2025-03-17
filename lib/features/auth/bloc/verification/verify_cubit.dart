import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/bloc/base_cubit.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/auth/interactor/auth_interactor.dart';
import 'package:home_management/features/auth/models/sms_verification_request_dto.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';

part 'verify_state.dart';

class VerifyCubit extends BaseCubit<VerifyState> {
  VerifyCubit(
    this._authInteractor,
    this._localRepository,
  ) : super(
          const VerifyState(
            canResend: false,
            status: BaseStatus.loading,
          ),
        );

  final TextEditingController pinController = TextEditingController();
  final AuthInteractor _authInteractor;
  final AuthLocalRepository _localRepository;
  Timer? _timer;

  Future addDevice() async {
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

  Future logIn() async {
    emit(
      state.copyWith(
        status: BaseStatus.loading,
      ),
    );
    final id = await _localRepository.getUserId();
    final response = await _authInteractor.signInWithSms(
      smsCode: SmsVerificationRequestDto(
        userId: id,
        code: pinController.text,
        device: state.device ?? '',
      ),
    );
    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (response) => emit(
        state.copyWith(
          status: BaseStatus.success,
          needToGoHomeScreen: true,
        ),
      ),
    );
  }

  void startTimer() {
    int counter = 30;
    if (isClosed) return;
    emit(
      state.copyWith(
        counter: counter,
        canResend: false,
        status: BaseStatus.success,
      ),
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }

      if (counter > 0) {
        counter--;
        emit(
          state.copyWith(
            counter: counter,
            canResend: false,
            status: BaseStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            counter: 0,
            canResend: true,
            status: BaseStatus.success,
          ),
        );
        timer.cancel();
      }
    });
  }

  void resendSms() {
    startTimer();
    print("Отправка SMS повторно");
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Останавливаем таймер перед закрытием
    return super.close();
  }
}
