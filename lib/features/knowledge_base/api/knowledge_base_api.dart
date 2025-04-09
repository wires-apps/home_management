import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_article_dto.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_category_dto.dart';

class KnowledgeBaseApi extends BaseApi {
  const KnowledgeBaseApi({required super.dio});

  Future<Response<List<KnowledgeBaseCategoryDto>>> getCategories({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    return callDioGetList(
      path: '/api/knowledge-base/categories',
      getData: (list) => list.map((json) => KnowledgeBaseCategoryDto.fromJson(json)).toList(),
    );
  }

  Future<Response<List<KnowledgeBaseArticleDto>>> getArticles({
    required int categoryId,
  }) async {
    return callDioGetList(
      path: '/api/knowledge-base/articles',
      queryParameters: {'category_id': categoryId},
      getData: (list) => list.map((json) => KnowledgeBaseArticleDto.fromJson(json)).toList(),
    );
  }

  Future<Response<KnowledgeBaseArticleDto>> getArticleById({
    required int articleId,
  }) async {
    return callDioGet(
      path: '/api/knowledge-base/articles/$articleId',
      getData: (json) => KnowledgeBaseArticleDto.fromJson(json),
    );
  }
}
