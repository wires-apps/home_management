import 'package:equatable/equatable.dart';
import 'package:home_management/features/voting/models/polls_response_dto.dart';
import 'package:home_management/features/voting/models/vote_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_polls_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SinglePollsResponseDto extends Equatable {
  const SinglePollsResponseDto({
    required this.poll,
    required this.votes,
  });

  @JsonKey(name: 'poll', required: true, includeIfNull: false)
  final PollsResponseDto poll;

  @JsonKey(name: 'votes', required: true, includeIfNull: false)
  final VoteResponseDto votes;

  factory SinglePollsResponseDto.fromJson(Map<String, dynamic> json) => _$SinglePollsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePollsResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        poll,
        votes,
      ];
}
