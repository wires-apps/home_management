// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_polls_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinglePollsResponseDto _$SinglePollsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SinglePollsResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['poll', 'votes'],
        );
        final val = SinglePollsResponseDto(
          poll: $checkedConvert('poll',
              (v) => PollsResponseDto.fromJson(v as Map<String, dynamic>)),
          votes: $checkedConvert('votes',
              (v) => VoteResponseDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SinglePollsResponseDtoToJson(
        SinglePollsResponseDto instance) =>
    <String, dynamic>{
      'poll': instance.poll.toJson(),
      'votes': instance.votes.toJson(),
    };
