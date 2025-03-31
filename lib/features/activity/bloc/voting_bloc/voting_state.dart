part of 'voting_bloc.dart';

class VotingState extends BaseState {
  const VotingState({
    this.needToCloseDialog = false,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;

  @override
  VotingState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
  }) =>
      VotingState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        needToCloseDialog: needToCloseDialog ?? this.needToCloseDialog,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        needToCloseDialog,
      ];
}
