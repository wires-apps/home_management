// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_store_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintStoreRequestDto _$ComplaintStoreRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ComplaintStoreRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = ComplaintStoreRequestDto(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ComplaintStoreRequestDtoToJson(
        ComplaintStoreRequestDto instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
