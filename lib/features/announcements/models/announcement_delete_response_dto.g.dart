// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_delete_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementDeleteResponseDto _$AnnouncementDeleteResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AnnouncementDeleteResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = AnnouncementDeleteResponseDto(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnnouncementDeleteResponseDtoToJson(
        AnnouncementDeleteResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
