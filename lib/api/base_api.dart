import 'dart:convert';

import 'package:dio/dio.dart';

const getMethod = 'GET';
const putMethod = 'PUT';
const postMethod = 'POST';
const deleteMethod = 'DELETE';

enum HttpMethod {
  get('GET'),
  put('PUT'),
  post('POST'),
  delete('DELETE');

  final String value;

  const HttpMethod(this.value);
}

const jsonContentType = 'application/json';

abstract class BaseApi {
  final Dio dio;

  const BaseApi({required this.dio});

  Options get putOptions => Options(
        method: putMethod,
        contentType: jsonContentType,
      );

  Options get getOptions => Options(
        method: getMethod,
        contentType: jsonContentType,
      );

  Options get postOptions => Options(
        method: postMethod,
        contentType: jsonContentType,
      );

  Options get deleteOptions => Options(
        method: deleteMethod,
        contentType: jsonContentType,
      );

  Future<Response<DATA>> callPut<REQUEST, DATA>({
    required String path,
    REQUEST? request,
    required HttpMethod method,
    Map<String, dynamic>? queryParam,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    final options = Options(method: method.value, contentType: jsonContentType);
    dynamic bodyData = _encodeRequest(request, options.compose(dio.options, path));

    final response = await dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      queryParameters: queryParam,
    );

    DATA responseData = _getData(response: response, getData: getData);

    return Response<DATA>(
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

  dynamic _encodeRequest(dynamic request, RequestOptions options) {
    try {
      return jsonEncode(request);
    } catch (error, stackTrace) {
      throw _getRequestDioException(options, error, stackTrace);
    }
  }

  DATA _getData<DATA>({
    required Response response,
    required DATA Function(Map<String, dynamic>) getData,
  }) {
    try {
      return getData(response.data! as Map<String, dynamic>);
    } catch (error, stackTrace) {
      throw _getResponseDioException(response, error, stackTrace);
    }
  }

  DioException _getResponseDioException(Response response, Object error, StackTrace stackTrace) {
    return DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.unknown,
      error: error,
      stackTrace: stackTrace,
    );
  }

  DioException _getRequestDioException(RequestOptions options, Object error, StackTrace stackTrace) {
    return DioException(
      requestOptions: options,
      type: DioExceptionType.unknown,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
