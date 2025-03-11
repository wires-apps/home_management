import 'dart:async';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:home_management/features/auth/models/sign_in_request_dto.dart';
import 'package:home_management/features/auth/models/sing_in_response_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_request_dto.dart';
import 'package:home_management/features/auth/models/sms_verification_response_dto.dart';

class AuthApi {
  final Dio _dio;

  const AuthApi(this._dio);

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
          _dio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(path, data: bodyData, options: options);

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

  Future<Response<SmsVerificationResponseDto>> smsSend({
    required SmsVerificationRequestDto smsRequest,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    const path = r'/api/verify-sms';
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
      bodyData = jsonEncode(smsRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: options.compose(
          _dio.options,
          path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final response = await _dio.request<Object>(path, data: bodyData, options: options);

    SmsVerificationResponseDto responseData;

    try {
      responseData = SmsVerificationResponseDto.fromJson(response.data! as Map<String, dynamic>);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SmsVerificationResponseDto>(
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
}
