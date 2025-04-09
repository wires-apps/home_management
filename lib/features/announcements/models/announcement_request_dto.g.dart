// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementRequestDto _$AnnouncementRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AnnouncementRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title', 'message'],
        );
        final val = AnnouncementRequestDto(
          title: $checkedConvert('title', (v) => v as String),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnnouncementRequestDtoToJson(
        AnnouncementRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
    };
