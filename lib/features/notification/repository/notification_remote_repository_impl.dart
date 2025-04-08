import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/notification/api/notification_api.dart';
import 'package:home_management/features/notification/models/notification_response_dto.dart';
import 'package:home_management/features/notification/models/notification_service_request_dto.dart';
import 'package:home_management/features/notification/models/notification_service_response_dto.dart';
import 'package:home_management/features/notification/models/single_data_notification_response_dto.dart';
import 'package:home_management/features/notification/repository/notification_remote_repository.dart';

class NotificationRemoteRepositoryImpl extends NotificationRemoteRepository with BaseRepository {
  final NotificationApi _notificationApi;

  NotificationRemoteRepositoryImpl(this._notificationApi);

  @override
  Future<Either<Failure, NotificationResponseDto>> getNotifications({
    required int page,
  }) =>
      execute(
        getResponse: () => _notificationApi.getNotifications(
          page: page,
        ),
      );

  @override
  Future<Either<Failure, SingleDataNotificationResponseDto>> getSingleNotification({
    required int id,
  }) =>
      execute(
        getResponse: () => _notificationApi.getSingleNotification(
          id: id,
        ),
      );

  @override
  Future<Either<Failure, NotificationServiceResponseDto>> sendFcmToken({
    required NotificationServiceRequestDto request,
  }) =>
      execute(
        getResponse: () => _notificationApi.sendFcmToken(
          fcmModel: request,
        ),
      );
}
