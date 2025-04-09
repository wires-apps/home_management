import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/activity/voting/repository/vote_remote_repository.dart';

import '../models/polls_response_dto.dart';

part 'voting_event.dart';
part 'voting_state.dart';

class VotingBloc extends BaseBloc<VotingEvent, VotingState> {
  VotingBloc(this._repository)
      : super(
          const VotingState(
            status: BaseStatus.loading,
          ),
        ) {
    on<PollsDownload>(_onLoadPolls);
  }

  final VoteRemoteRepository _repository;

  // Future<void> _onCallMaster(
  //   CallMaster event,
  //   Emitter<CallMasterState> emit,
  // ) async {
  //   if (state.image == null && state.selectedCategory == null) return;
  //   emit(state.copyWith(isLoading: true));
  //   final photos = [state.image!];
  //   final response = await _repository.callMaster(
  //     request: ServiceRequestStoreDto(
  //       photos: photos,
  //       type: state.selectedCategory!.name,
  //       description: controller.text,
  //     ),
  //   );
  //
  //   response.fold(
  //     (failure) => emit(
  //       state.copyWith(
  //         status: BaseStatus.failure,
  //         dialogInfo: SnackBarInfo.getErrorMessage(failure),
  //       ),
  //     ),
  //     (complaints) => emit(
  //       state.copyWith(
  //         status: BaseStatus.success,
  //         hasCalling: true,
  //         dialogInfo: const SnackBarInfo(title: 'Успешно отправлено', message: 'Свяжемся с вами в ближайшее время'),
  //       ),
  //     ),
  //   );
  // }

  Future<void> _onLoadPolls(
    PollsDownload event,
    Emitter<VotingState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getPolls();

    response.fold(
        (l) => emit(
              state.copyWith(
                status: BaseStatus.failure,
                dialogInfo: SnackBarInfo.getErrorMessage(l),
              ),
            ), (r) {
      emit(
        state.copyWith(
          status: BaseStatus.success,
          polls: r,
        ),
      );
    });
  }
}
