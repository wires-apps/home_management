import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/announcements/models/announcement_request_dto.dart';
import 'package:home_management/features/announcements/repository/announcements_remote_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'new_announcement_event.dart';
part 'new_announcement_state.dart';

class NewAnnouncementBloc extends BaseBloc<NewAnnouncementEvent, NewAnnouncementState> {
  NewAnnouncementBloc({required AnnouncementsRemoteRepository repository})
      : _repository = repository,
        super(
          const NewAnnouncementState(
            status: BaseStatus.success,
          ),
        ) {
    on<NewAnnouncementPickImageEvent>(_onChangeImage);
    on<NewAnnouncementSendToStore>(_onSendToStore);
    on<NewAnnouncementCheckButtonAvailability>(_checkButtonAvailability);
    messageController.addListener(_addCheckButtonAvailabilityEvent);
    titleController.addListener(_addCheckButtonAvailabilityEvent);
  }

  final ImagePicker _picker = ImagePicker();
  final AnnouncementsRemoteRepository _repository;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _addCheckButtonAvailabilityEvent() {
    add(NewAnnouncementCheckButtonAvailability());
  }

  _onChangeImage(
    NewAnnouncementPickImageEvent event,
    Emitter<NewAnnouncementState> emit,
  ) async {
    final pickedFile = await _picker.pickImage(source: event.source);
    if (pickedFile != null) {
      emit(
        state.copyWith(
          image: File(pickedFile.path),
        ),
      );
      _addCheckButtonAvailabilityEvent();
    }
  }

  _onSendToStore(
    NewAnnouncementSendToStore event,
    Emitter<NewAnnouncementState> emit,
  ) async {
    emitLoading(emit);
    final photos = state.image != null ? [state.image!] : null;
    final response = await _repository.sendAnnouncement(
      request: AnnouncementRequestDto(
        photos: photos,
        title: titleController.text,
        message: messageController.text,
      ),
    );
    handleWithFailure(
      emit: emit,
      either: response,
      onSuccess: (suggestion) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            dialogInfo: const SnackBarInfo(title: 'Отлично', message: 'Объявление было успешно создано!'),
            hasAnnouncement: true,
            // complaints: complaints,
          ),
        );
      },
    );
  }

  void _checkButtonAvailability(
    NewAnnouncementCheckButtonAvailability event,
    Emitter<NewAnnouncementState> emit,
  ) {
    emit(
      state.copyWith(
        isButtonEnabled: titleController.text.isNotEmpty && messageController.text.isNotEmpty,
      ),
    );
  }
}
