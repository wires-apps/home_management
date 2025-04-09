part of 'article_details_bloc.dart';

class ArticleDetailsState extends BaseState {
  const ArticleDetailsState({
    required super.status,
    super.dialogInfo,
    this.article,
  });

  final KnowledgeBaseArticleDto? article;

  @override
  ArticleDetailsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    KnowledgeBaseArticleDto? article,
  }) =>
      ArticleDetailsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        article: article ?? this.article,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        article,
      ];
}
