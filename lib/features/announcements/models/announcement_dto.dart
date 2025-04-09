import 'package:equatable/equatable.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnouncementDto extends Equatable {
  const AnnouncementDto({
    required this.id,
    required this.title,
    required this.content,
    this.residentialComplexId,
    this.createdAt,
    this.updatedAt,
    required this.photos,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: 'content', required: true, includeIfNull: false)
  final String content;

  @JsonKey(name: 'residential_complex_id', required: false, includeIfNull: false)
  final int? residentialComplexId;

  @JsonKey(name: 'created_at', required: false, includeIfNull: false)
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at', required: false, includeIfNull: false)
  final DateTime? updatedAt;

  @JsonKey(name: 'photos', required: true, includeIfNull: false)
  final List<PhotoModelResponseDto> photos;

  factory AnnouncementDto.fromJson(Map<String, dynamic> json) => _$AnnouncementDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        residentialComplexId,
        createdAt,
        updatedAt,
        photos,
      ];
}
