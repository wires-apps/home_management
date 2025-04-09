// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_store_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionStoreRequestDto _$SuggestionStoreRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SuggestionStoreRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = SuggestionStoreRequestDto(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$SuggestionStoreRequestDtoToJson(
        SuggestionStoreRequestDto instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
