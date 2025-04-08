import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_article_dto.dart';
import 'package:home_management/features/knowledge_base/repository/knowledge_base_remote_repository.dart';

part 'knowledge_base_articles_event.dart';
part 'knowledge_base_articles_state.dart';

class KnowledgeBaseArticlesBloc extends Bloc<KnowledgeBaseArticlesEvent, KnowledgeBaseArticlesState> {
  KnowledgeBaseArticlesBloc({required KnowledgeBaseRemoteRepository repository})
      : _repository = repository,
        super(
          const KnowledgeBaseArticlesState(
            status: BaseStatus.loading,
          ),
        ) {
    on<KnowledgeBaseArticlesDataLoaded>(_onLoadList);
  }

  final KnowledgeBaseRemoteRepository _repository;

  _onLoadList(
    KnowledgeBaseArticlesDataLoaded event,
    Emitter<KnowledgeBaseArticlesState> emit,
  ) async {
    print('I WORK');
    final response = await _repository.getArticles(categoryId: event.categoryId);

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (articles) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            articles: articles,
          ),
        );
      },
    );
  }
}
