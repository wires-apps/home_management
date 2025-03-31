import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';

part 'knowledge_base_event.dart';

part 'knowledge_base_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  MasterBloc()
      : super(
          const MasterState(
            status: BaseStatus.loading,
          ),
        ) {
    on<SelectCategory>(_onSelectCategory);
    on<UpdateDetails>(_onUpdateDetails);
    on<AttachImage>(_onAttachImage);
  }

  void _onSelectCategory(SelectCategory event, Emitter<MasterState> emit) {
    if (!isClosed) {
      emit(state.copyWith(selectedCategory: event.category));
    }
  }

  void _onUpdateDetails(UpdateDetails event, Emitter<MasterState> emit) {
    if (!isClosed) {
      emit(state.copyWith(details: event.details));
    }
  }

  void _onAttachImage(AttachImage event, Emitter<MasterState> emit) {
    if (!isClosed) {
      emit(state.copyWith(image: event.image));
    }
  }
}
