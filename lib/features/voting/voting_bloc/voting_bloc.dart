import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/voting/repository/vote_remote_repository.dart';

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
      ),
      (r) => emit(
        state.copyWith(
          status: BaseStatus.success,
          polls: r,
        ),
      ),
    );
  }
}
