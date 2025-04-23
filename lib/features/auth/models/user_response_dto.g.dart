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
              $checkedConvert('personal_account', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
          residentialComplexId: $checkedConvert(
              'residential_complex_id', (v) => (v as num?)?.toInt()),
          blockNumber: $checkedConvert('block_number', (v) => v as String?),
          apartmentNumber:
              $checkedConvert('apartment_number', (v) => v as String?),
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
      if (instance.personalAccount case final value?) 'personal_account': value,
      if (instance.phoneNumber case final value?) 'phone_number': value,
      if (instance.residentialComplexId case final value?)
        'residential_complex_id': value,
      if (instance.blockNumber case final value?) 'block_number': value,
      if (instance.apartmentNumber case final value?) 'apartment_number': value,
    };
