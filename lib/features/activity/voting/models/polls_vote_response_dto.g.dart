// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_vote_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollsVoteResponseDto _$PollsVoteResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PollsVoteResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = PollsVoteResponseDto(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PollsVoteResponseDtoToJson(
        PollsVoteResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
