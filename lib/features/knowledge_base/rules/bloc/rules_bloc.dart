import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:image_picker/image_picker.dart';

part 'rules_event.dart';

part 'rules_state.dart';

class RulesBloc extends BaseBloc<RulesEvent, RulesState> {
  RulesBloc()
      : super(const RulesState(
          status: BaseStatus.success,
        )) {
    on<PickImageEvent>(_onChangeImage);
    on<ChangePage>(_onChangePage);
  }

  final ImagePicker _picker = ImagePicker();

  _onChangeImage(
    PickImageEvent event,
    Emitter<RulesState> emit,
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
    Emitter<RulesState> emit,
  ) =>
      emit(state.copyWith(page: event.page));
}
