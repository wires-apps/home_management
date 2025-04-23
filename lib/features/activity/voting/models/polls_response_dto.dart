import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'polls_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PollsResponseDto extends Equatable {
  const PollsResponseDto({
    required this.id,
    required this.title,
    required this.description,
    required this.residentialComplexId,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: 'description', required: true, includeIfNull: false)
  final String description;

  @JsonKey(name: 'residential_complex_id', required: true, includeIfNull: false)
  final int? residentialComplexId;

  @JsonKey(name: 'start_date', required: true, includeIfNull: false)
  final String startDate;

  @JsonKey(name: 'end_date', required: true, includeIfNull: false)
  final String endDate;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String createdAt;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String updatedAt;

  factory PollsResponseDto.fromJson(Map<String, dynamic> json) => _$PollsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PollsResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        residentialComplexId,
        startDate,
        endDate,
        createdAt,
        updatedAt,
      ];
}
