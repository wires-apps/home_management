import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';
import 'package:home_management/features/notification/models/data_notification_response_dto.dart';
import 'package:home_management/features/notification/models/notification_service_request_dto.dart';
import 'package:home_management/features/notification/repository/notification_remote_repository.dart';
import 'package:home_management/features/notification/service/notifications_service.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(
    this._repository,
    this._localRepository, this.notificationsService,
  ) : super(
          const HomeState(
            status: BaseStatus.loading,
            items: [],
          ),
        ) {
    on<NotificationsDownload>(_onLoadNotifications);
    on<LogoutEvent>(_onLogoutFromAccount);
    on<NotificationSendFcmToken>(_onSendFcmToken);

    // on<LoginPasswordChanged>(_onChangePhoneNumber);
    // on<LoginValidateField>(_onValidField);
    // on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final NotificationRemoteRepository _repository;
  final AuthLocalRepository _localRepository;
  final NotificationsService notificationsService;


  Future<void> _onLogoutFromAccount(
    LogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    _localRepository.clear();
    emit(
      state.copyWith(
        status: BaseStatus.success,
        needToCloseHomePage: true,
      ),
    );
  }

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


  Future<void> _onSendFcmToken(
      NotificationSendFcmToken event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final token = await notificationsService.getFcmToken();
    if (token == null) return;
    final response = await _repository.sendFcmToken(
      request: NotificationServiceRequestDto(
        fcmToken: token,
      ),
    );

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
        ),
      );
    });
  }
}
