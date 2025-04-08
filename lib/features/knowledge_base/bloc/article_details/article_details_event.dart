part of 'article_details_bloc.dart';

abstract class ArticleDetailsEvent extends BaseEvent {
  const ArticleDetailsEvent();

  @override
  List<Object> get props => [];
}

class ArticleDetailsByIdLoaded extends ArticleDetailsEvent {
  final int id;

  const ArticleDetailsByIdLoaded({required this.id});

  @override
  List<Object> get props => [id];
}
