import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_response_dto.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_article_dto.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_category_dto.dart';

class KnowledgeBaseApi extends BaseApi {
  final Dio _dio;

  const KnowledgeBaseApi(this._dio) : super(dio: _dio);

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

  Future<Response<ComplaintStoreResponseDto>> sendComplaintStore({
    required ComplaintStoreRequestDto request,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callMultipart(
        path: '/api/complaints',
        method: HttpMethod.post,
        request: request,
        toJson: (r) => r.toJson(),
        extractFiles: (r) => r.photos ?? [],
        fileFieldName: 'photos',
        getData: (json) => ComplaintStoreResponseDto.fromJson(json),
      );

  Future<Response<SuggestionStoreResponseDto>> sendSuggestion({
    required SuggestionStoreRequestDto request,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callMultipart(
        path: '/api/suggestions',
        method: HttpMethod.post,
        request: request,
        toJson: (r) => r.toJson(),
        extractFiles: (r) => r.photos ?? [],
        fileFieldName: 'photos',
        getData: (json) => SuggestionStoreResponseDto.fromJson(json),
      );
}
