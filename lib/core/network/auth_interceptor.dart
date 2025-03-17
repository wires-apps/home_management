import 'dart:io';

import 'package:dio/dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/constants.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authLocalRepository);

  final AuthLocalRepository _authLocalRepository;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final talker = getIt<Talker>();

    talker.info('AuthInterceptor onRequest -> path: ${options.path}}'
        '\n data: ${options.data}'
        '\n baseUrl: ${options.baseUrl}'
        '\n headers: ${options.headers}'
        '');
    if (options.path != authSignInEndpoint) {
      final token = await _authLocalRepository.getSessionToken();
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
