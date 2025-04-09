import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/knowledge_base/api/knowledge_base_api.dart';
import 'package:home_management/features/knowledge_base/bloc/article_details/article_details_bloc.dart';
import 'package:home_management/features/knowledge_base/bloc/articles/knowledge_base_articles_bloc.dart';
import 'package:home_management/features/knowledge_base/bloc/categories/knowledge_base_bloc.dart';
import 'package:home_management/features/knowledge_base/repository/knowledge_base_remote_repository.dart';
import 'package:home_management/features/knowledge_base/repository/knowledge_base_remote_repository_impl.dart';

void initKnowledgeBaseModule() {
  getIt.registerLazySingleton(() => KnowledgeBaseApi(dio: getIt<MainDio>().dio));
  getIt.registerLazySingleton<KnowledgeBaseRemoteRepository>(() => KnowledgeBaseRemoteRepositoryImpl(api: getIt()));
  getIt.registerFactory(() => KnowledgeBaseBloc(repository: getIt()));
  getIt.registerFactory(() => KnowledgeBaseArticlesBloc(repository: getIt()));
  getIt.registerFactory(() => ArticleDetailsBloc(repository: getIt()));
}
