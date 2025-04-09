import 'package:equatable/equatable.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_category_dto.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'knowledge_base_article_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class KnowledgeBaseArticleDto extends Equatable {
  const KnowledgeBaseArticleDto({
    required this.id,
    required this.title,
    required this.content,
    required this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
    required this.photos,
  });

  @JsonKey(name: 'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: 'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: 'content', required: true, includeIfNull: false)
  final String content;

  @JsonKey(name: 'category_id', required: true, includeIfNull: false)
  final int categoryId;

  @JsonKey(name: 'created_at', required: false, includeIfNull: false)
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at', required: false, includeIfNull: false)
  final DateTime? updatedAt;

  @JsonKey(name: 'category', required: false, includeIfNull: false)
  final KnowledgeBaseCategoryDto? category;

  @JsonKey(name: 'photos', required: true, includeIfNull: false)
  final List<PhotoModelResponseDto> photos;

  factory KnowledgeBaseArticleDto.fromJson(Map<String, dynamic> json) => _$KnowledgeBaseArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeBaseArticleDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        categoryId,
        createdAt,
        updatedAt,
        category,
        photos,
      ];
}
