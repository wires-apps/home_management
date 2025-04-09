import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/call_master/models/service_request_store_dto.dart';
import 'package:home_management/features/call_master/models/service_response_categories_dto.dart';
import 'package:home_management/features/call_master/repository/call_master_remote_repository.dart';

part 'master_event.dart';

part 'master_state.dart';

class CallMasterBloc extends BaseBloc<CallMasterEvent, CallMasterState> {
  CallMasterBloc(this._repository)
      : super(
          const CallMasterState(
            status: BaseStatus.loading,
          ),
        ) {
    on<SelectCategory>(_onSelectCategory);
    on<UpdateDetails>(_onUpdateDetails);
    on<AttachImage>(_onAttachImage);
    on<LoadCategories>(_onLoadCategories);
    on<CallMaster>(_onCallMaster);
  }

  final CallMasterRemoteRepository _repository;
  final TextEditingController controller = TextEditingController();

  void _onSelectCategory(SelectCategory event, Emitter<CallMasterState> emit) {
    if (!isClosed) {
      emit(state.copyWith(selectedCategory: event.category));
    }
  }

  void _onUpdateDetails(UpdateDetails event, Emitter<CallMasterState> emit) {
    if (!isClosed) {
      emit(state.copyWith(details: event.details));
    }
  }

  void _onAttachImage(AttachImage event, Emitter<CallMasterState> emit) {
    if (!isClosed) {
      emit(state.copyWith(image: event.image));
    }
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CallMasterState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getCategories();

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (categories) => emit(
        state.copyWith(
          status: BaseStatus.success,
          categories: categories,
        ),
      ),
    );
  }

  Future<void> _onCallMaster(
    CallMaster event,
    Emitter<CallMasterState> emit,
  ) async {
    if (state.image == null && state.selectedCategory == null) return;
    final photos = [state.image!];
    final response = await _repository.callMaster(
      request: ServiceRequestStoreDto(
        photos: photos,
        type: state.selectedCategory!.name,
        description: controller.text,
      ),
    );

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (complaints) => emit(
        state.copyWith(
          status: BaseStatus.success,
          showDialog: true,
        ),
      ),
    );
  }
}
