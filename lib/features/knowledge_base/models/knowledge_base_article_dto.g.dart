// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_base_article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeBaseArticleDto _$KnowledgeBaseArticleDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'KnowledgeBaseArticleDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'title',
            'content',
            'category_id',
            'photos'
          ],
        );
        final val = KnowledgeBaseArticleDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          content: $checkedConvert('content', (v) => v as String),
          categoryId: $checkedConvert('category_id', (v) => (v as num).toInt()),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updated_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          category: $checkedConvert(
              'category',
              (v) => v == null
                  ? null
                  : KnowledgeBaseCategoryDto.fromJson(
                      v as Map<String, dynamic>)),
          photos: $checkedConvert(
              'photos',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      PhotoModelResponseDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'categoryId': 'category_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$KnowledgeBaseArticleDtoToJson(
        KnowledgeBaseArticleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category_id': instance.categoryId,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
      if (instance.category?.toJson() case final value?) 'category': value,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };
