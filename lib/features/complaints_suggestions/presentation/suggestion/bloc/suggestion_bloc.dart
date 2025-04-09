import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends BaseBloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc(this._repository)
      : super(
          const SuggestionState(
            status: BaseStatus.success,
          ),
        ) {
    on<SuggestionPickImageEvent>(_onChangeImage);
    on<SuggestionSendToStore>(_onSendComplaint);
    on<SuggestionCheckButtonAvailability>(_checkButtonAvailability);
    textController.addListener(_addCheckButtonAvailabilityEvent);
  }

  final ImagePicker _picker = ImagePicker();
  final ComplaintsSuggestionsRemoteRepository _repository;
  final TextEditingController textController = TextEditingController();

  void _addCheckButtonAvailabilityEvent() {
    add(SuggestionCheckButtonAvailability());
  }

  _onChangeImage(
    SuggestionPickImageEvent event,
    Emitter<SuggestionState> emit,
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

  _onSendComplaint(
    SuggestionSendToStore event,
    Emitter<SuggestionState> emit,
  ) async {
    if (state.image == null) return;
    emit(state.copyWith(isLoading: true));
    final photos = [state.image!];
    // return await Future.delayed(Duration(seconds: 3), () {
    //   return emit(state.copyWith(isLoading: false));
    // });
    final response = await _repository.sendSuggestion(
      request: SuggestionStoreRequestDto(
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
      (suggestion) {
        emit(
          state.copyWith(
            isLoading: false,
            status: BaseStatus.success,
            dialogInfo:
                const SnackBarInfo(title: 'Успешно отправлено', message: 'Предложение было успешно отправлено!'),
            hasSuggestion: true,
            // complaints: complaints,
          ),
        );
      },
    );
  }

  void _checkButtonAvailability(
    SuggestionCheckButtonAvailability event,
    Emitter<SuggestionState> emit,
  ) {
    emit(
      state.copyWith(
        isButtonEnabled: textController.text.isNotEmpty && state.image != null,
      ),
    );
  }
}
