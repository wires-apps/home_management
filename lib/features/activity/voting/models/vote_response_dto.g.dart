// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteResponseDto _$VoteResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VoteResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['yes', 'no', 'abstain'],
        );
        final val = VoteResponseDto(
          yes: $checkedConvert('yes', (v) => (v as num).toInt()),
          no: $checkedConvert('no', (v) => (v as num).toInt()),
          abstain: $checkedConvert('abstain', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$VoteResponseDtoToJson(VoteResponseDto instance) =>
    <String, dynamic>{
      'yes': instance.yes,
      'no': instance.no,
      'abstain': instance.abstain,
    };
