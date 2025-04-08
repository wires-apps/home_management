import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_response_dto.dart';

class ComplaintSuggestionApi extends BaseApi {
  final Dio _dio;

  const ComplaintSuggestionApi(this._dio) : super(dio: _dio);

  Future<Response<List<SingleComplaintResponseDto>>> getComplaints({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    const path = r'/api/complaints';
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
    );

    final response = await _dio.request<Object>(path, options: options);

    List<SingleComplaintResponseDto> responseData;

    try {
      responseData = (response.data! as List<dynamic>).map((e) => SingleComplaintResponseDto.fromJson(e)).toList();
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<List<SingleComplaintResponseDto>>(
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

  Future<Response<SingleComplaintResponseDto>> getSingleComplaint({
    required int id,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callPut(
        path: '/api/complaints/$id',
        method: HttpMethod.get,
        getData: (json) => SingleComplaintResponseDto.fromJson(json),
      );

  Future<Response<ComplaintStoreResponseDto>> sendComplaintStore({
    required ComplaintStoreRequestDto request,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callMultipart(
        path: '/api/complaints',
        method: HttpMethod.post,
        request: request,
        toJson: (r) => r.toJson(),
        extractFiles: (r) => r.photos ?? [],
        fileFieldName: 'photos',
        getData: (json) => ComplaintStoreResponseDto.fromJson(json),
      );
}
