part of 'voting_bloc.dart';

class VotingState extends BaseState {
  const VotingState({
    this.needToCloseDialog = false,
    this.selectedOption,
    this.polls,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;
  final String? selectedOption;
  final List<PollsResponseDto>? polls;

  @override
  VotingState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
    String? selectedOption,
    List<PollsResponseDto>? polls
  }) =>
      VotingState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        needToCloseDialog: needToCloseDialog ?? this.needToCloseDialog,
        selectedOption: selectedOption ?? this.selectedOption,
        polls: polls ?? this.polls,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        needToCloseDialog,
        selectedOption,
      ];
}
