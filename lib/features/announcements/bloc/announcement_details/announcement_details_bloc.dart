import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';
import 'package:home_management/features/announcements/repository/announcements_remote_repository.dart';

part 'announcement_details_event.dart';
part 'announcement_details_state.dart';

class AnnouncementDetailsBloc extends BaseBloc<AnnouncementDetailsEvent, AnnouncementDetailsState> {
  AnnouncementDetailsBloc({required AnnouncementsRemoteRepository repository})
      : _repository = repository,
        super(
          const AnnouncementDetailsState(
            status: BaseStatus.loading,
          ),
        ) {
    on<AnnouncementDetailsDataLoaded>(_onLoadList);
  }

  final AnnouncementsRemoteRepository _repository;

  _onLoadList(
    AnnouncementDetailsDataLoaded event,
    Emitter<AnnouncementDetailsState> emit,
  ) async {
    final response = await _repository.getAnnouncementById(id: event.announcementId);

    handleWithFailure(
      emit: emit,
      either: response,
      onSuccess: (announcement) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            announcement: announcement,
          ),
        );
      },
    );
  }
}
