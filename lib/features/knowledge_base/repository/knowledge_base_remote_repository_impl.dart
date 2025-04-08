import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/knowledge_base/api/knowledge_base_api.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_article_dto.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_category_dto.dart';
import 'package:home_management/features/knowledge_base/repository/knowledge_base_remote_repository.dart';

class KnowledgeBaseRemoteRepositoryImpl with BaseRepository implements KnowledgeBaseRemoteRepository {
  final KnowledgeBaseApi _api;

  KnowledgeBaseRemoteRepositoryImpl({required KnowledgeBaseApi api}) : _api = api;

  @override
  Future<Either<Failure, List<KnowledgeBaseCategoryDto>>> getCategories() {
    return execute(
      getResponse: () => _api.getCategories(),
    );
  }

  @override
  Future<Either<Failure, List<KnowledgeBaseArticleDto>>> getArticles({required int categoryId}) {
    return execute(
      getResponse: () => _api.getArticles(categoryId: categoryId),
    );
  }

  @override
  Future<Either<Failure, KnowledgeBaseArticleDto>> getArticleById({required int id}) {
    return execute(
      getResponse: () => _api.getArticleById(articleId: id),
    );
  }
}
