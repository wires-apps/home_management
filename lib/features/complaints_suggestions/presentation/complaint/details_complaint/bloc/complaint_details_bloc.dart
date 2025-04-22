import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'complaint_details_event.dart';

part 'complaint_details_state.dart';

class ComplaintDetailsBloc extends BaseBloc<ComplaintDetailsEvent, ComplaintDetailsState> {
  ComplaintDetailsBloc(this._repository)
      : super(const ComplaintDetailsState(
          status: BaseStatus.success,
        )) {
    on<PickImageEvent>(_onChangeImage);
    on<ChangePage>(_onChangePage);
    on<DownloadItemComplaint>(_onDownloadById);
  }

  final ImagePicker _picker = ImagePicker();
  final ComplaintsSuggestionsRemoteRepository _repository;

  void _onChangeImage(
    PickImageEvent event,
    Emitter<ComplaintDetailsState> emit,
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

  void _onChangePage(
    ChangePage event,
    Emitter<ComplaintDetailsState> emit,
  ) =>
      emit(state.copyWith(page: event.page));

  Future _onDownloadById(
    DownloadItemComplaint event,
    Emitter<ComplaintDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getSingleComplaint(id: event.id);

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (complaint) {
        emit(
          state.copyWith(
            status: BaseStatus.success,
            complaint: complaint,
          ),
        );
      },
    );
  }
}
