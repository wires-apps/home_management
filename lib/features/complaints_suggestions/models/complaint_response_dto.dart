import 'package:equatable/equatable.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complaint_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SingleComplaintResponseDto extends Equatable {
  const SingleComplaintResponseDto({
    required this.id,
    required this.userId,
    required this.message,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'user_id', required: true, includeIfNull: false)
  final int userId;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: 'status', required: true, includeIfNull: false)
  final String status;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String createdAt;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String updatedAt;

  @JsonKey(name: 'photos', required: true, includeIfNull: false)
  final List<PhotoModelResponseDto> photos;

  factory SingleComplaintResponseDto.fromJson(Map<String, dynamic> json) => _$SingleComplaintResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SingleComplaintResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        message,
        status,
        createdAt,
        updatedAt,
        photos,
      ];
}
