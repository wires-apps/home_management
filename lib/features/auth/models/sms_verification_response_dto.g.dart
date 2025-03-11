// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_verification_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsVerificationResponseDto _$SmsVerificationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmsVerificationResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['auth_token', 'user'],
        );
        final val = SmsVerificationResponseDto(
          authToken: $checkedConvert('auth_token', (v) => v as String),
          user: $checkedConvert('user',
              (v) => UserResponseDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'authToken': 'auth_token'},
    );

Map<String, dynamic> _$SmsVerificationResponseDtoToJson(
        SmsVerificationResponseDto instance) =>
    <String, dynamic>{
      'auth_token': instance.authToken,
      'user': instance.user.toJson(),
    };
