import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'polls_vote_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PollsVoteResponseDto extends Equatable {
  const PollsVoteResponseDto({required this.message});

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  factory PollsVoteResponseDto.fromJson(Map<String, dynamic> json) => _$PollsVoteResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PollsVoteResponseDtoToJson(this);

  @override
  List<Object?> get props => [];
}
