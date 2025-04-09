// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_store_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionStoreResponseDto _$SuggestionStoreResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SuggestionStoreResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'user_id',
            'message',
            'created_at',
            'updated_at',
            'id'
          ],
        );
        final val = SuggestionStoreResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          message: $checkedConvert('message', (v) => v as String),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$SuggestionStoreResponseDtoToJson(
        SuggestionStoreResponseDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'message': instance.message,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id': instance.id,
    };
