part of 'knowledge_base_articles_bloc.dart';

abstract class KnowledgeBaseArticlesEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class KnowledgeBaseArticlesDataLoaded extends KnowledgeBaseArticlesEvent {
  final int categoryId;

  KnowledgeBaseArticlesDataLoaded({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
