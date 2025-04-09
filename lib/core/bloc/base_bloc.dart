import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc<Event extends BaseEvent, State extends BaseState> extends Bloc<Event, State> {
  BaseBloc(super.initialState);

  void emitLoading(Emitter<BaseState> emit) {
    emit(state.copyWith(status: BaseStatus.loading));
  }

  void handleWithFailure<T>({
    required Emitter<BaseState> emit,
    required Either<Failure, T> either,
    required Function(T) onSuccess,
  }) {
    return either.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      onSuccess,
    );
  }
}
