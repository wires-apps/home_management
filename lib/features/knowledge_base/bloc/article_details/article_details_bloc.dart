import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_article_dto.dart';
import 'package:home_management/features/knowledge_base/repository/knowledge_base_remote_repository.dart';

part 'article_details_event.dart';
part 'article_details_state.dart';

class ArticleDetailsBloc extends BaseBloc<ArticleDetailsEvent, ArticleDetailsState> {
  ArticleDetailsBloc({required KnowledgeBaseRemoteRepository repository})
      : _repository = repository,
        super(const ArticleDetailsState(
          status: BaseStatus.success,
        )) {
    on<ArticleDetailsByIdLoaded>(_onLoadById);
  }

  final KnowledgeBaseRemoteRepository _repository;

  Future _onLoadById(
    ArticleDetailsByIdLoaded event,
    Emitter<ArticleDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getArticleById(id: event.id);

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (article) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            article: article,
          ),
        );
      },
    );
  }
}
