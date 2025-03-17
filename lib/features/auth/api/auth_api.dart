import 'dart:async';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/auth/models/sign_in_request_dto.dart';
import 'package:home_management/features/auth/models/sing_in_response_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_request_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_response_dto.dart';

class AuthApi extends BaseApi {
  final Dio _dio;
  final Dio _authDio;

  const AuthApi(this._dio, this._authDio) : super(dio: _dio);

  Future<Response<SignInResponseDto>> signIn({
    required SignInRequestDto signInRequest,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    const path = r'/api/auth';
    final options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
    );

    dynamic bodyData;

    try {
      bodyData = jsonEncode(signInRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: options.compose(
          _authDio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _authDio.request<Object>(path, data: bodyData, options: options);

    SignInResponseDto responseData;

    try {
      responseData = SignInResponseDto.fromJson(response.data! as Map<String, dynamic>);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SignInResponseDto>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  Future<Response<SmsVerificationResponseDto>> verifySms({
    required SmsVerificationRequestDto smsRequest,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async =>
      callPut(
        path: r'/api/verify-sms',
        request: smsRequest,
        method: HttpMethod.post,
        getData: (json) => SmsVerificationResponseDto.fromJson(json),
      );
}
