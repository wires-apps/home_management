// import 'package:dartz/dartz.dart';
// import 'package:home_management/features/call_master/repository/call_master_remote_repository.dart';
//
// class CallMasterRemoteRepositoryImpl extends CallMasterRemoteRepository {
//   final NotificationApi _notificationApi;
//
//   CallMasterRemoteRepositoryImpl(this._notificationApi);
//
//   @override
//   Future<Either<Failure, NotificationResponseDto>> getNotifications({
//     required int page,
//   }) =>
//       execute(
//         getResponse: () => _notificationApi.getNotifications(
//           page: page,
//         ),
//       );
//
//   @override
//   Future<Either<Failure, SingleDataNotificationResponseDto>> getSingleNotification({
//     required int id,
//   }) =>
//       execute(
//         getResponse: () => _notificationApi.getSingleNotification(
//           id: id,
//         ),
//       );
//
//   @override
//   Future<Either<Failure, NotificationServiceResponseDto>> sendFcmToken({
//     required NotificationServiceRequestDto request,
//   }) =>
//       execute(
//         getResponse: () => _notificationApi.sendFcmToken(
//           fcmModel: request,
//         ),
//       );
// }
