import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/features/public_utilities/models/debts_data_response_dto.dart';

class UtilityBillsApi {
  final Dio _dio;

  const UtilityBillsApi(this._dio);

  Future<Response<DebtsDataResponse>> getDebts({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    const path = r'/api/debts';
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
    );

    final response = await _dio.request<Object>(path, options: options);

    DebtsDataResponse responseData;

    try {
      responseData = DebtsDataResponse.fromJson(response.data! as Map<String, dynamic>);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<DebtsDataResponse>(
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
