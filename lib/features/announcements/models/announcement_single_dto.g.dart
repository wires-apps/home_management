// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_single_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementSingleDto _$AnnouncementSingleDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AnnouncementSingleDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['announcement', 'deletable'],
        );
        final val = AnnouncementSingleDto(
          announcement: $checkedConvert('announcement',
              (v) => AnnouncementDto.fromJson(v as Map<String, dynamic>)),
          deletable: $checkedConvert('deletable', (v) => v as bool),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnnouncementSingleDtoToJson(
        AnnouncementSingleDto instance) =>
    <String, dynamic>{
      'announcement': instance.announcement.toJson(),
      'deletable': instance.deletable,
    };
