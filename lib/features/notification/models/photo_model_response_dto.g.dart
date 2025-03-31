// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModelResponseDto _$PhotoModelResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PhotoModelResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'path',
            'photoable_type',
            'photoable_id',
            'created_at',
            'updated_at'
          ],
        );
        final val = PhotoModelResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
          path: $checkedConvert('path', (v) => v as String),
          photoableType: $checkedConvert('photoable_type', (v) => v as String),
          photoableId:
              $checkedConvert('photoable_id', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'photoableType': 'photoable_type',
        'photoableId': 'photoable_id'
      },
    );

Map<String, dynamic> _$PhotoModelResponseDtoToJson(
        PhotoModelResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'photoable_type': instance.photoableType,
      'photoable_id': instance.photoableId,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.updatedAt case final value?) 'updated_at': value,
    };
