import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';
import 'package:home_management/features/announcements/repository/announcements_remote_repository.dart';

part 'announcements_event.dart';
part 'announcements_state.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState> {
  AnnouncementsBloc({required AnnouncementsRemoteRepository repository})
      : _repository = repository,
        super(
          const AnnouncementsState(
            status: BaseStatus.loading,
          ),
        ) {
    on<AnnouncementsDataLoaded>(_onLoadList);
  }

  final AnnouncementsRemoteRepository _repository;

  _onLoadList(
    AnnouncementsDataLoaded event,
    Emitter<AnnouncementsState> emit,
  ) async {
    final response = await _repository.getAnnouncements();

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (announcements) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            announcements: announcements,
          ),
        );
      },
    );
  }
}
