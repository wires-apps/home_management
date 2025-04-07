import 'package:equatable/equatable.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_notification_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DataNotificationResponseDto extends Equatable {
  const DataNotificationResponseDto({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.userId,
    required this.residentialComplexId,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: 'type', required: true, includeIfNull: false)
  final String type;

  @JsonKey(name: 'user_id', required: false, includeIfNull: false)
  final int? userId;

  @JsonKey(name: 'residential_complex_id', required: false, includeIfNull: false)
  final int? residentialComplexId;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String? createdAt;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String? updatedAt;

  @JsonKey(name: 'photos', required: true, includeIfNull: false)
  final List<PhotoModelResponseDto> photos;

  factory DataNotificationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DataNotificationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataNotificationResponseDtoToJson(this);

  @override
  List<Object?> get props => [id, title, message, type, userId, residentialComplexId, createdAt, updatedAt, photos];
}
