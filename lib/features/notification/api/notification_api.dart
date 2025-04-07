import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/notification/models/notification_response_dto.dart';
import 'package:home_management/features/notification/models/notification_service_request_dto.dart';
import 'package:home_management/features/notification/models/notification_service_response_dto.dart';
import 'package:home_management/features/notification/models/single_data_notification_response_dto.dart';

class NotificationApi extends BaseApi {
  const NotificationApi(Dio dio) : super(dio: dio);

  Future<Response<NotificationResponseDto>> getNotifications({
    required int page,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async =>
      await callPut(
        path: '/api/notifications',
        method: HttpMethod.get,
        queryParam: <String, dynamic>{
          'page': page,
        },
        getData: (json) => NotificationResponseDto.fromJson(json),
      );

  Future<Response<SingleDataNotificationResponseDto>> getSingleNotification({
    required int id,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async =>
      await callPut(
        path: '/api/notifications/$id',
        method: HttpMethod.get,
        getData: (json) => SingleDataNotificationResponseDto.fromJson(json),
      );

  Future<Response<NotificationServiceResponseDto>> sendFcmToken({
    required NotificationServiceRequestDto fcmModel,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async =>
      await callPut(
        path: '/api/user-fcm-token',
        method: HttpMethod.post,
        request: fcmModel,
        getData: (json) => NotificationServiceResponseDto.fromJson(json),
      );
}
