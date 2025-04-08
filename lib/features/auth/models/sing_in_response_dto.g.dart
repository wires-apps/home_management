// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_in_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseDto _$SignInResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SignInResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message', 'requires_verification', 'user_id'],
        );
        final val = SignInResponseDto(
          message: $checkedConvert('message', (v) => v as String),
          requiresVerification:
              $checkedConvert('requires_verification', (v) => v as bool),
          userId: $checkedConvert('user_id', (v) => v as num),
        );
        return val;
      },
      fieldKeyMap: const {
        'requiresVerification': 'requires_verification',
        'userId': 'user_id'
      },
    );

Map<String, dynamic> _$SignInResponseDtoToJson(SignInResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'requires_verification': instance.requiresVerification,
      'user_id': instance.userId,
    };
