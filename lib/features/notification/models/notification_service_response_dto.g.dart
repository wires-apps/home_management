// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_service_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationServiceResponseDto _$NotificationServiceResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'NotificationServiceResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = NotificationServiceResponseDto(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$NotificationServiceResponseDtoToJson(
        NotificationServiceResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
