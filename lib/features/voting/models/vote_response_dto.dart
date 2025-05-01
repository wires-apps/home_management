import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vote_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoteResponseDto extends Equatable {
  const VoteResponseDto({
    required this.yes,
    required this.no,
    required this.abstain,
  });

  @JsonKey(name: 'yes', required: true, includeIfNull: false)
  final int yes;

  @JsonKey(name: 'no', required: true, includeIfNull: false)
  final int no;

  @JsonKey(name: 'abstain', required: true, includeIfNull: false)
  final int abstain;

  factory VoteResponseDto.fromJson(Map<String, dynamic> json) => _$VoteResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VoteResponseDtoToJson(this);

  @override
  List<Object?> get props => [yes, no, abstain];
}
