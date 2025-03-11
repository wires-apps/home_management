// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_verification_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsVerificationRequestDto _$SmsVerificationRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SmsVerificationRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['user_id', 'code', 'device'],
        );
        final val = SmsVerificationRequestDto(
          userId: $checkedConvert('user_id', (v) => v as num),
          code: $checkedConvert('code', (v) => v as String),
          device: $checkedConvert('device', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id'},
    );

Map<String, dynamic> _$SmsVerificationRequestDtoToJson(
        SmsVerificationRequestDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'code': instance.code,
      'device': instance.device,
    };
