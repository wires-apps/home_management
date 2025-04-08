// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkNotificationResponseDto _$LinkNotificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LinkNotificationResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['label', 'active'],
        );
        final val = LinkNotificationResponseDto(
          url: $checkedConvert('url', (v) => v as String?),
          label: $checkedConvert('label', (v) => v as String),
          isActive: $checkedConvert('active', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isActive': 'active'},
    );

Map<String, dynamic> _$LinkNotificationResponseDtoToJson(
        LinkNotificationResponseDto instance) =>
    <String, dynamic>{
      if (instance.url case final value?) 'url': value,
      'label': instance.label,
      'active': instance.isActive,
    };
