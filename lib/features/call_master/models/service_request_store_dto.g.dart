// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRequestStoreDto _$ServiceRequestStoreDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ServiceRequestStoreDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['type', 'description'],
        );
        final val = ServiceRequestStoreDto(
          type: $checkedConvert('type', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ServiceRequestStoreDtoToJson(
        ServiceRequestStoreDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };
