import 'dart:convert';
import 'dart:io';

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

  Future<Response<DATA>> callMultipart<DATA>({
    required String path,
    required HttpMethod method,
    required dynamic request,
    required Map<String, dynamic> Function(dynamic request) toJson,
    List<File?> Function(dynamic request)? extractFiles,
    required String fileFieldName,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    final List<File?> files = extractFiles?.call(request) ?? [];

    final List<MultipartFile> multipartFiles = (await Future.wait(
      files.map((file) async {
        if (file != null) {
          return await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          );
        }
        return null;
      }),
    ))
        .whereType<MultipartFile>()
        .toList();

    final fields = toJson(request);
    if (multipartFiles.isNotEmpty) {
      fields['$fileFieldName[]'] = multipartFiles;
    }

    final formData = FormData.fromMap(fields);

    final response = await dio.request<Object>(
      path,
      data: formData,
      options: Options(method: method.value),
    );

    final responseData = _getData(response: response, getData: getData);

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

  DATA _getListData<DATA>({
    required Response response,
    required DATA Function(List<dynamic>) getData,
  }) {
    try {
      return getData(response.data! as List<dynamic>);
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

  Future<Response<DATA>> callDioPut<REQUEST, DATA>({
    required String path,
    required REQUEST request,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    return _call(path: path, request: request, options: putOptions, getData: getData);
  }

  Future<Response<DATA>> callDioPost<REQUEST, DATA>({
    required String path,
    required REQUEST request,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    return _call(path: path, request: request, options: postOptions, getData: getData);
  }

  Future<Response<DATA>> callDioGet<REQUEST, DATA>({
    required String path,
    REQUEST? request,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    return _call(path: path, request: request, options: getOptions, getData: getData);
  }

  Future<Response<DATA>> callDioDelete<REQUEST, DATA>({
    required String path,
    REQUEST? request,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    return _call(path: path, request: request, options: deleteOptions, getData: getData);
  }

  Future<Response<DATA>> _call<REQUEST, DATA>({
    required String path,
    required REQUEST request,
    required Options options,
    required DATA Function(Map<String, dynamic>) getData,
  }) async {
    dynamic bodyData = _encodeRequest(request, options.compose(dio.options, path));

    final response = await dio.request<Object>(path, data: bodyData, options: options);

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

  Future<Response<DATA>> _callList<REQUEST, DATA>({
    required String path,
    required REQUEST request,
    required Options options,
    required DATA Function(List<dynamic>) getData,
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic bodyData = _encodeRequest(request, options.compose(dio.options, path));

    final response = await dio.request<Object>(
      path,
      data: bodyData,
      options: options,
      queryParameters: queryParameters,
    );

    DATA responseData = _getListData(response: response, getData: getData);

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

  Future<Response<DATA>> callDioGetList<REQUEST, DATA>({
    required String path,
    REQUEST? request,
    Map<String, dynamic>? queryParameters,
    required DATA Function(List<dynamic>) getData,
  }) async {
    return _callList(
      path: path,
      request: request,
      options: getOptions,
      getData: getData,
      queryParameters: queryParameters,
    );
  }
}
