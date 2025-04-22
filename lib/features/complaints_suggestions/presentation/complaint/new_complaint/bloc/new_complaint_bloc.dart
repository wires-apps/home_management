import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'new_complaint_event.dart';

part 'new_complaint_state.dart';

class NewComplaintBloc extends BaseBloc<NewComplaintEvent, NewComplaintState> {
  NewComplaintBloc(this._repository)
      : super(
          const NewComplaintState(
            status: BaseStatus.success,
          ),
        ) {
    on<PickImageEvent>(_onChangeImage);
    on<ChangePage>(_onChangePage);
    on<SendComplaintStore>(_onSendComplaint);
    on<ComplaintCheckButtonAvailability>(_checkButtonAvailability);
    textController.addListener(_addCheckButtonAvailabilityEvent);
  }

  final ImagePicker _picker = ImagePicker();
  final ComplaintsSuggestionsRemoteRepository _repository;
  final TextEditingController textController = TextEditingController();

  void _addCheckButtonAvailabilityEvent() {
    add(ComplaintCheckButtonAvailability());
  }

  _onChangeImage(
    PickImageEvent event,
    Emitter<NewComplaintState> emit,
  ) async {
    final pickedFile = await _picker.pickImage(source: event.source);
    if (pickedFile != null) {
      emit(
        state.copyWith(
          image: File(pickedFile.path),
        ),
      );
    }
  }

  _onSendComplaint(
    SendComplaintStore event,
    Emitter<NewComplaintState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final photos = [state.image];
    final response = await _repository.sendComplaintStore(
      request: ComplaintStoreRequestDto(
        photos: photos,
        message: textController.text,
      ),
    );

    response.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (complaint) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            hasComplaint: true,
            dialogInfo: const SnackBarInfo(
              title: 'Успешно отправлено',
              message: 'Жалоба была успешно отправлена!',
            ),
          ),
        );
      },
    );
  }

  _onChangePage(
    ChangePage event,
    Emitter<NewComplaintState> emit,
  ) =>
      emit(state.copyWith(page: event.page));

  void _checkButtonAvailability(
    ComplaintCheckButtonAvailability event,
    Emitter<NewComplaintState> emit,
  ) {
    emit(
      state.copyWith(
        isButtonEnabled: textController.text.isNotEmpty,
      ),
    );
  }
}
