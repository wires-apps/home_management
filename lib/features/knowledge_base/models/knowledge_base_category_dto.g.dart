// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_base_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeBaseCategoryDto _$KnowledgeBaseCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'KnowledgeBaseCategoryDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'name'],
        );
        final val = KnowledgeBaseCategoryDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updated_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at', 'updatedAt': 'updated_at'},
    );

Map<String, dynamic> _$KnowledgeBaseCategoryDtoToJson(
        KnowledgeBaseCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };
