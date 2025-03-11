import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:image_picker/image_picker.dart';

part 'complaint_details_event.dart';

part 'complaint_details_state.dart';

class ComplaintDetailsBloc extends BaseBloc<ComplaintDetailsEvent, ComplaintDetailsState> {
  ComplaintDetailsBloc()
      : super(const ComplaintDetailsState(
          status: BaseStatus.success,
        )) {
    on<PickImageEvent>(_onChangeImage);
    on<ChangePage>(_onChangePage);
  }

  final ImagePicker _picker = ImagePicker();

  _onChangeImage(
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

  _onChangePage(
    ChangePage event,
    Emitter<ComplaintDetailsState> emit,
  ) =>
      emit(state.copyWith(page: event.page));
}
