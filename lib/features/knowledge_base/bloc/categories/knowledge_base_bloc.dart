import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/knowledge_base/models/knowledge_base_category_dto.dart';
import 'package:home_management/features/knowledge_base/repository/knowledge_base_remote_repository.dart';

part 'knowledge_base_event.dart';
part 'knowledge_base_state.dart';

class KnowledgeBaseBloc extends Bloc<KnowledgeBaseEvent, KnowledgeBaseState> {
  KnowledgeBaseBloc({required KnowledgeBaseRemoteRepository repository})
      : _repository = repository,
        super(
          const KnowledgeBaseState(
            status: BaseStatus.loading,
          ),
        ) {
    on<SelectCategory>(_onSelectCategory);
    on<UpdateDetails>(_onUpdateDetails);
    on<AttachImage>(_onAttachImage);
    on<KnowledgeBaseDataLoaded>(_onLoadList);
  }

  final KnowledgeBaseRemoteRepository _repository;

  _onLoadList(
    KnowledgeBaseDataLoaded event,
    Emitter<KnowledgeBaseState> emit,
  ) async {
    final response = await _repository.getCategories();

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (categories) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            categories: categories,
          ),
        );
      },
    );
  }

  void _onSelectCategory(SelectCategory event, Emitter<KnowledgeBaseState> emit) {
    if (!isClosed) {
      emit(state.copyWith(selectedCategory: event.category));
    }
  }

  void _onUpdateDetails(UpdateDetails event, Emitter<KnowledgeBaseState> emit) {
    if (!isClosed) {
      emit(state.copyWith(details: event.details));
    }
  }

  void _onAttachImage(AttachImage event, Emitter<KnowledgeBaseState> emit) {
    if (!isClosed) {
      emit(state.copyWith(image: event.image));
    }
  }
}
