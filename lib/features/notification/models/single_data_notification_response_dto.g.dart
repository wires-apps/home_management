// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_data_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleDataNotificationResponseDto _$SingleDataNotificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SingleDataNotificationResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['data'],
        );
        final val = SingleDataNotificationResponseDto(
          data: $checkedConvert(
              'data',
              (v) => SingleNotificationResponseDto.fromJson(
                  v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SingleDataNotificationResponseDtoToJson(
        SingleDataNotificationResponseDto instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };
