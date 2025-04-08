part of 'knowledge_base_articles_bloc.dart';

class KnowledgeBaseArticlesState extends BaseState {
  final List<KnowledgeBaseArticleDto>? articles;

  const KnowledgeBaseArticlesState({
    required super.status,
    super.dialogInfo,
    this.articles,
  });

  @override
  KnowledgeBaseArticlesState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    List<KnowledgeBaseArticleDto>? articles,
  }) =>
      KnowledgeBaseArticlesState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        articles: articles ?? this.articles,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        articles,
      ];
}
