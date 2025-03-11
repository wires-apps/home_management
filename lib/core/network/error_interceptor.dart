import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ErrorInterceptor extends Interceptor {
  final Talker talker;

  ErrorInterceptor({required this.talker});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    talker.info('\nonRequest:'
        '\nUri: ${options.uri}'
        '\nData: ${options.data}'
        '\nQuery Parameters${options.queryParameters}'
        '\nHeaders:${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != '/api/users/me' &&
        err.requestOptions.path != '/auth/login') {
    }
    talker.error('\nonError:'
        '\nResponse: ${err.response}'
        '\nError message: ${err.message}'
        '\nUri: ${err.requestOptions.uri}'
        '\nPath: ${err.requestOptions.path}'
        '\nData: ${err.response?.data}'
        '\nStatus code${err.response?.statusCode}');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data is Map<String, dynamic> &&
            (response.data as Map).containsKey('result') &&
            response.data['result'] is List
        ? (response.data as Map).containsKey('totalCount')
            ? 'Length: ${response.data['totalCount']}'
            : null
        : response.data;
    talker.info("\nonResponse:"
        "\nUri: ${response.realUri}"
        "\nRequestOptions -> Path: ${response.requestOptions.path}"
        "\nstatus code: ${response.statusCode}"
        "\nData type: ${response.data.runtimeType}"
        "\nData: $data");
    super.onResponse(response, handler);
  }
}
