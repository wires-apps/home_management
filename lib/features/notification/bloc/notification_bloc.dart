import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/notification/models/single_notification_response_dto.dart';
import 'package:home_management/features/notification/repository/notification_remote_repository.dart';
import 'package:url_launcher/url_launcher.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  NotificationBloc(this._repository)
      : super(
          const NotificationState(
            status: BaseStatus.loading,
          ),
        ) {
    on<NotificationDownload>(_onLoadSingleNotificationById);
    on<NotificationOpenPdfUrl>(_onOpenPdfUrl);
    // on<LoginValidateField>(_onValidField);
    // on<LoginTogglePasswordVisibility>(_onChangeObscuredPassword);
  }

  final NotificationRemoteRepository _repository;

  Future<void> _onLoadSingleNotificationById(
    NotificationDownload event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getSingleNotification(id: event.id);

    response.fold(
        (l) => emit(
              state.copyWith(
                status: BaseStatus.failure,
                dialogInfo: SnackBarInfo.getErrorMessage(l),
              ),
            ), (r) {
      print('Загрузил');
      emit(
        state.copyWith(
          status: BaseStatus.success,
          item: r.data,
        ),
      );
    });
  }

  Future<void> _onOpenPdfUrl(
    NotificationOpenPdfUrl event,
    Emitter<NotificationState> emit,
  ) async {
    const String baseUrl = 'http://212.112.105.242:8800';
    String fullUrl = "$baseUrl${event.url}";
    final Uri pdfUri = Uri.parse(fullUrl);
    if (await canLaunchUrl(pdfUri)) {
      await launchUrl(pdfUri, mode: LaunchMode.externalApplication);
    } else {
      emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(
            ServerFailure('Не удалось открыть ${event.url}'),
          ),
        ),
      );
      throw 'Не удалось открыть ${event.url}';
    }
  }
}
