// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleComplaintResponseDto _$SingleComplaintResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SingleComplaintResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'user_id',
            'message',
            'status',
            'created_at',
            'updated_at',
            'photos'
          ],
        );
        final val = SingleComplaintResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          message: $checkedConvert('message', (v) => v as String),
          status: $checkedConvert('status', (v) => v as String),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
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
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$SingleComplaintResponseDtoToJson(
        SingleComplaintResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'message': instance.message,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };
