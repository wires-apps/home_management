import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'complaint_event.dart';

part 'complaint_state.dart';

class ComplaintBloc extends BaseBloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc(this._repository)
      : super(
          const ComplaintState(
            status: BaseStatus.success,
          ),
        ) {
    on<PickImageEvent>(_onChangeImage);
    on<ChangePage>(_onChangePage);
    on<DownloadComplaint>(_onLoadComplaint);
    on<SendComplaintStore>(_onSendComplaint);
  }

  final ImagePicker _picker = ImagePicker();
  final ComplaintsSuggestionsRemoteRepository _repository;

  _onChangeImage(
    PickImageEvent event,
    Emitter<ComplaintState> emit,
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

  _onLoadComplaint(
    DownloadComplaint event,
    Emitter<ComplaintState> emit,
  ) async {
    final response = await _repository.getComplaints();

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (complaints) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            complaints: complaints,
          ),
        );
      },
    );
  }

  _onSendComplaint(
    SendComplaintStore event,
    Emitter<ComplaintState> emit,
  ) async {
    if (state.image == null) return;
    final photos = [state.image!];
    final response = await _repository.sendComplaintStore(
      request: ComplaintStoreRequestDto(
        photos: photos,
        message: 'мои пожелания, сделать громо отвод',
      ),
    );

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (complaints) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            // complaints: complaints,
          ),
        );
      },
    );
  }

  _onChangePage(
    ChangePage event,
    Emitter<ComplaintState> emit,
  ) =>
      emit(state.copyWith(page: event.page));
}
