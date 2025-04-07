import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/notification/models/notification_response_dto.dart';
import 'package:home_management/features/notification/models/notification_service_request_dto.dart';
import 'package:home_management/features/notification/models/notification_service_response_dto.dart';
import 'package:home_management/features/notification/models/single_data_notification_response_dto.dart';

abstract class NotificationRemoteRepository {
  Future<Either<Failure, NotificationResponseDto>> getNotifications({required int page});

  Future<Either<Failure, SingleDataNotificationResponseDto>> getSingleNotification({required int id});

  Future<Either<Failure, NotificationServiceResponseDto>> sendFcmToken(
      {required NotificationServiceRequestDto request});
}
