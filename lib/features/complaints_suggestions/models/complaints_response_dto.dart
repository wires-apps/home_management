import 'package:equatable/equatable.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complaints_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComplaintsResponseDto extends Equatable {
  const ComplaintsResponseDto({
    required this.complaints,
  });

  final List<SingleComplaintResponseDto> complaints;

  factory ComplaintsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ComplaintsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintsResponseDtoToJson(this);

  @override
  List<Object?> get props => [complaints];
}
