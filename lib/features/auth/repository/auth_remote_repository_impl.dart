import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/auth/models/sign_in_request_dto.dart';
import 'package:home_management/features/auth/models/sing_in_response_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_request_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_response_dto.dart';

import '../api/auth_api.dart';
import 'auth_remote_repository.dart';

class AuthRemoteRepositoryImpl extends AuthRemoteRepository with BaseRepository {
  AuthRemoteRepositoryImpl(this._authApi);

  final AuthApi _authApi;

  @override
  Future<Either<Failure, SignInResponseDto>> logIn(
    SignInRequestDto signInRequest,
  ) async =>
      execute(
        getResponse: () => _authApi.signIn(
          signInRequest: signInRequest,
        ),
      );

  @override
  Future<Either<Failure, SmsVerificationResponseDto>> verifySms(
    SmsVerificationRequestDto signInRequest,
  ) async =>
      execute(
        getResponse: () => _authApi.verifySms(
          smsRequest: signInRequest,
        ),
      );
}
