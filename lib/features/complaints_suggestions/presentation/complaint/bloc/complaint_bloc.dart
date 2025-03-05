import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:image_picker/image_picker.dart';

part 'complaint_event.dart';

part 'complaint_state.dart';

class ComplaintBloc extends BaseBloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc()
      : super(const ComplaintState(
          status: BaseStatus.success,
        )) {
    on<PickImageEvent>(_onChangeImage);
    on<ChangePage>(_onChangePage);
  }

  final ImagePicker _picker = ImagePicker();

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

  _onChangePage(
    ChangePage event,
    Emitter<ComplaintState> emit,
  ) =>
      emit(state.copyWith(page: event.page));
}
