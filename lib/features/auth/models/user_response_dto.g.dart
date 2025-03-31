// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseDto _$UserResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'personal_account',
            'phone_number',
            'block_number',
            'apartment_number'
          ],
        );
        final val = UserResponseDto(
          id: $checkedConvert('id', (v) => v as num),
          name: $checkedConvert('name', (v) => v as String),
          personalAccount:
              $checkedConvert('personal_account', (v) => v as String),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String),
          residentialComplexId: $checkedConvert(
              'residential_complex_id', (v) => (v as num?)?.toInt()),
          blockNumber: $checkedConvert('block_number', (v) => v as String),
          apartmentNumber:
              $checkedConvert('apartment_number', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'personalAccount': 'personal_account',
        'phoneNumber': 'phone_number',
        'residentialComplexId': 'residential_complex_id',
        'blockNumber': 'block_number',
        'apartmentNumber': 'apartment_number'
      },
    );

Map<String, dynamic> _$UserResponseDtoToJson(UserResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'personal_account': instance.personalAccount,
      'phone_number': instance.phoneNumber,
      if (instance.residentialComplexId case final value?)
        'residential_complex_id': value,
      'block_number': instance.blockNumber,
      'apartment_number': instance.apartmentNumber,
    };
