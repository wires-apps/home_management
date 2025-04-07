// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_service_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationServiceRequestDto _$NotificationServiceRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'NotificationServiceRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['fcm_token'],
        );
        final val = NotificationServiceRequestDto(
          fcmToken: $checkedConvert('fcm_token', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'fcmToken': 'fcm_token'},
    );

Map<String, dynamic> _$NotificationServiceRequestDtoToJson(
        NotificationServiceRequestDto instance) =>
    <String, dynamic>{
      'fcm_token': instance.fcmToken,
    };
