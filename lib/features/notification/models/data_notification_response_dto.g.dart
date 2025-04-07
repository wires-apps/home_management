// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_notification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNotificationResponseDto _$DataNotificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DataNotificationResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'title',
            'message',
            'type',
            'created_at',
            'updated_at',
            'photos'
          ],
        );
        final val = DataNotificationResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          message: $checkedConvert('message', (v) => v as String),
          type: $checkedConvert('type', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => (v as num?)?.toInt()),
          residentialComplexId: $checkedConvert(
              'residential_complex_id', (v) => (v as num?)?.toInt()),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
          photos: $checkedConvert(
              'photos',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PhotoModelResponseDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'residentialComplexId': 'residential_complex_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$DataNotificationResponseDtoToJson(
        DataNotificationResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
      if (instance.userId case final value?) 'user_id': value,
      if (instance.residentialComplexId case final value?)
        'residential_complex_id': value,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.updatedAt case final value?) 'updated_at': value,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };
