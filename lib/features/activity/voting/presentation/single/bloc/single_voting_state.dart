part of 'single_voting_bloc.dart';

class SingleVotingState extends BaseState {
  const SingleVotingState({
    this.needToCloseDialog = false,
    this.isChooseVoting = false,
    this.hasVoting = false,
    this.selectedOption,
    this.poll,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;
  final String? selectedOption;
  final SinglePollsResponseDto? poll;
  final bool isChooseVoting;
  final bool hasVoting;

  @override
  SingleVotingState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
    String? selectedOption,
    SinglePollsResponseDto? poll,
    bool? hasVoting,
    bool? isChooseVoting,
  }) =>
      SingleVotingState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        needToCloseDialog: needToCloseDialog ?? this.needToCloseDialog,
        selectedOption: selectedOption ?? this.selectedOption,
        poll: poll ?? this.poll,
        hasVoting: hasVoting ?? this.hasVoting,
        isChooseVoting: isChooseVoting ?? this.isChooseVoting,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        needToCloseDialog,
        selectedOption,
        poll,
        hasVoting,
        isChooseVoting,
      ];
}
