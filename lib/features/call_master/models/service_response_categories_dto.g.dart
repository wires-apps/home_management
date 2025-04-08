// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_response_categories_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceResponseStoreItemDto _$ServiceResponseStoreItemDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ServiceResponseStoreItemDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'name_rus',
            'created_at',
            'updated_at'
          ],
        );
        final val = ServiceResponseStoreItemDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          nameRus: $checkedConvert('name_rus', (v) => v as String),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'nameRus': 'name_rus',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$ServiceResponseStoreItemDtoToJson(
        ServiceResponseStoreItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_rus': instance.nameRus,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.updatedAt case final value?) 'updated_at': value,
    };
