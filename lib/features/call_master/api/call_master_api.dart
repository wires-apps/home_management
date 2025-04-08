import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/call_master/models/service_request_store_dto.dart';
import 'package:home_management/features/call_master/models/service_response_categories_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';

class CallMasterApi extends BaseApi {
  final Dio _dio;

  CallMasterApi(this._dio) : super(dio: _dio);

  Future<Response<ServiceRequestStoreDto>> sendComplaintStore({
    required ComplaintStoreRequestDto request,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callMultipart(
        path: '/api/service-requests',
        method: HttpMethod.post,
        request: request,
        toJson: (r) => r.toJson(),
        extractFiles: (r) => r.photos ?? [],
        fileFieldName: 'photos',
        getData: (json) => ServiceRequestStoreDto.fromJson(json),
      );

  Future<Response<List<ServiceResponseStoreItemDto>>> getServiceCategories({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    const path = r'/api/service-requests-categories';
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

    List<ServiceResponseStoreItemDto> responseData;

    try {
      responseData = (response.data! as List<dynamic>).map((e) => ServiceResponseStoreItemDto.fromJson(e)).toList();
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<List<ServiceResponseStoreItemDto>>(
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
