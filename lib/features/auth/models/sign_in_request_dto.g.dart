// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestDto _$SignInRequestDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SignInRequestDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'personal_account',
            'password',
            'device',
            'phone_number'
          ],
        );
        final val = SignInRequestDto(
          password: $checkedConvert('password', (v) => v as String),
          personalAccount:
              $checkedConvert('personal_account', (v) => v as String),
          device: $checkedConvert('device', (v) => v as String),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'personalAccount': 'personal_account',
        'phoneNumber': 'phone_number'
      },
    );

Map<String, dynamic> _$SignInRequestDtoToJson(SignInRequestDto instance) =>
    <String, dynamic>{
      'personal_account': instance.personalAccount,
      'password': instance.password,
      'device': instance.device,
      'phone_number': instance.phoneNumber,
    };
