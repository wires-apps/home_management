import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/auth/models/sms_verification_request_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_response_dto.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';

import '../repository/auth_remote_repository.dart';

class AuthInteractor {
  const AuthInteractor(
    this._authRemoteRepository,
    this._authLocalRepository,
  );

  final AuthRemoteRepository _authRemoteRepository;
  final AuthLocalRepository _authLocalRepository;

  /// Вход через СМС (логин)
  Future<Either<Failure, SmsVerificationResponseDto>> signInWithSms({
    required SmsVerificationRequestDto smsCode,
  }) async {
    final result = await _authRemoteRepository.verifySms(smsCode);

    return result.fold(
      (failure) => Left(failure),
      (response) async {
        await _authLocalRepository.saveSessionToken(response.authToken);
        return Right(response);
      },
    );
  }

  /// Проверка, есть ли сохранённый токен
  Future<bool> isUserLoggedIn() async => await _authLocalRepository.getSessionToken() != null;

  /// Выход из аккаунта (удаление токена)
  Future<void> logOut() async {
    await _authLocalRepository.clear();
  }
}
