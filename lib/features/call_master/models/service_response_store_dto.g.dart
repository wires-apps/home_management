// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_response_store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceResponseStoreDto _$ServiceResponseStoreDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ServiceResponseStoreDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'type',
            'user_id',
            'description',
            'updated_at',
            'created_at'
          ],
        );
        final val = ServiceResponseStoreDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          type: $checkedConvert('type', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'updatedAt': 'updated_at',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$ServiceResponseStoreDtoToJson(
        ServiceResponseStoreDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'user_id': instance.userId,
      'description': instance.description,
      if (instance.updatedAt case final value?) 'updated_at': value,
      if (instance.createdAt case final value?) 'created_at': value,
    };
