import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PhotoModelResponseDto extends Equatable {
  const PhotoModelResponseDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.path,
    required this.photoableType,
    required this.photoableId,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'path', required: true, includeIfNull: false)
  final String path;

  @JsonKey(name: 'photoable_type', required: true, includeIfNull: false)
  final String photoableType;

  @JsonKey(name: 'photoable_id', required: true, includeIfNull: false)
  final int photoableId;

  @JsonKey(name: 'created_at', required: true, includeIfNull: false)
  final String? createdAt;

  @JsonKey(name: 'updated_at', required: true, includeIfNull: false)
  final String? updatedAt;

  factory PhotoModelResponseDto.fromJson(Map<String, dynamic> json) => _$PhotoModelResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelResponseDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        path,
        photoableType,
        photoableId,
      ];
}
