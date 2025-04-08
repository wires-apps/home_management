import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_article_dto.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_category_dto.dart';

abstract interface class KnowledgeBaseRemoteRepository {
  Future<Either<Failure, List<KnowledgeBaseCategoryDto>>> getCategories();
  Future<Either<Failure, List<KnowledgeBaseArticleDto>>> getArticles({required int categoryId});
  Future<Either<Failure, KnowledgeBaseArticleDto>> getArticleById({required int id});
}
