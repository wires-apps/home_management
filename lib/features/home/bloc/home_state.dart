part of 'home_bloc.dart';

class HomeState extends BaseState {
  const HomeState({
    this.needToCloseDialog = false,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;

  @override
  HomeState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
  }) =>
      HomeState(
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
