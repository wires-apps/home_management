import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/voting/models/single_polls_response_dto.dart';
import 'package:home_management/features/voting/repository/vote_remote_repository.dart';

part 'single_voting_event.dart';

part 'single_voting_state.dart';

class SingleVotingBloc extends BaseBloc<SingleVotingEvent, SingleVotingState> {
  SingleVotingBloc(
    this._repository,
  ) : super(
          const SingleVotingState(
            status: BaseStatus.loading,
          ),
        ) {
    on<VoteChanged>(_onSendVote);
    on<ChooseVoice>(_onChooseVoice);
    on<VoteLoadById>(_onLoadById);
  }

  final VoteRemoteRepository _repository;

  Future<void> _onChooseVoice(
    ChooseVoice event,
    Emitter<SingleVotingState> emit,
  ) async {
    if (event.isChoose) {
      final id = state.poll?.poll.id;
      final option = state.selectedOption;
      if (id == null && option == null) return;
      final response = await _repository.sendVote(idPoll: id!, vote: option!);
      response.fold(
        (failure) => emit(
          state.copyWith(
            status: BaseStatus.failure,
            hasVoting: true,
            dialogInfo: SnackBarInfo.getErrorMessage(failure),
          ),
        ),
        (response) => emit(
          state.copyWith(
            status: BaseStatus.success,
            hasVoting: true,
            selectedOption: option,
            dialogInfo: SnackBarInfo(
              title: 'Успешно отправлено',
              message: response.message,
            ),
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          hasVoting: false,
          isChooseVoting: false,
          status: BaseStatus.success,
          selectedOption: null,
        ),
      );
    }
  }

  Future<void> _onSendVote(
    VoteChanged event,
    Emitter<SingleVotingState> emit,
  ) async {
    final option = _localizeVote(event.option);
    emit(
      state.copyWith(
        selectedOption: option,
        isChooseVoting: true,
      ),
    );
  }

  Future<void> _onLoadById(
    VoteLoadById event,
    Emitter<SingleVotingState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    print('id ===============> ${event.id}');
    final response = await _repository.getSingleVote(id: event.id);

    response.fold(
      (failure) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(failure),
        ),
      ),
      (vote) => emit(
        state.copyWith(
          status: BaseStatus.success,
          poll: vote,
        ),
      ),
    );
  }

  String _localizeVote(String option) {
    switch (option) {
      case 'Да':
        return 'yes';
      case 'Нет':
        return 'no';
      case 'Воздержаться':
        return 'abstain';
      default:
        throw ArgumentError('Неизвестный вариант голосования: $option');
    }
  }
}
