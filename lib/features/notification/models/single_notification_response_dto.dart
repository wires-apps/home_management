import 'package:equatable/equatable.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_notification_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SingleNotificationResponseDto extends Equatable {
  const SingleNotificationResponseDto({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.userId,
    required this.residentialComplexId,
    required this.photos,
    required this.hasPdf,
    required this.pdfUrl,
    required this.createdAt,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'type', required: true, includeIfNull: false)
  final String type;

  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: 'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: 'user_id', required: false, includeIfNull: false)
  final String? userId;

  @JsonKey(name: 'residential_complex_id', required: false, includeIfNull: false)
  final int? residentialComplexId;

  @JsonKey(name: 'photos', required: true, includeIfNull: false)
  final List<PhotoModelResponseDto> photos;

  @JsonKey(name: 'has_pdf', required: true, includeIfNull: false)
  final bool hasPdf;

  @JsonKey(name: 'pdf_url', required: true, includeIfNull: false)
  final String? pdfUrl;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String createdAt;

  factory SingleNotificationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SingleNotificationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SingleNotificationResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        type,
        title,
        message,
        userId,
        residentialComplexId,
        photos,
        hasPdf,
        pdfUrl,
        createdAt,
      ];
}
