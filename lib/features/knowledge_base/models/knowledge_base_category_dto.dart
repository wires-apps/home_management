import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'knowledge_base_category_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class KnowledgeBaseCategoryDto extends Equatable {
  const KnowledgeBaseCategoryDto({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: 'created_at', required: false, includeIfNull: false)
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at', required: false, includeIfNull: false)
  final DateTime? updatedAt;

  factory KnowledgeBaseCategoryDto.fromJson(Map<String, dynamic> json) => _$KnowledgeBaseCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeBaseCategoryDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        updatedAt,
      ];
}
