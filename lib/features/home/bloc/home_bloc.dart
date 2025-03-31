import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/notification/models/data_notification_response_dto.dart';
import 'package:home_management/features/notification/repository/notification_remote_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._repository)
      : super(
          const HomeState(
            status: BaseStatus.loading,
            items: [],
          ),
        ) {
    on<NotificationsDownload>(_onLoadNotifications);
    // on<LoginPasswordChanged>(_onChangePhoneNumber);
    // on<LoginValidateField>(_onValidField);
    // on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final NotificationRemoteRepository _repository;

  Future<void> _onLoadNotifications(
    NotificationsDownload event,
    Emitter<HomeState> emit,
  ) async {
    if (state.items.isEmpty) emit(state.copyWith(hasReachedMax: false));
    if (state.hasReachedMax) return;
    if (event.isFirstFetch) {
      emit(
        state.copyWith(
          status: BaseStatus.loading,
        ),
      );
    }
    final page = state.currentPage < state.lastPage ? state.currentPage + 1 : state.currentPage;
    final response = await _repository.getNotifications(page: page);
    final hasReachedMax = state.currentPage == state.lastPage;

    response.fold(
        (l) => emit(
              state.copyWith(
                status: BaseStatus.failure,
                dialogInfo: SnackBarInfo.getErrorMessage(l),
              ),
            ), (r) {
      emit(
        state.copyWith(
            status: BaseStatus.success,
            items: r.data,
            lastPage: r.lastPage,
            currentPage: r.currentPage,
            hasReachedMax: hasReachedMax),
      );
    });
  }
}
