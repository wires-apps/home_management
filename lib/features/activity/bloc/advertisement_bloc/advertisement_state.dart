part of 'advertisement_bloc.dart';

class AdvertisementState extends BaseState {
  const AdvertisementState({
    this.needToCloseDialog = false,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;

  @override
  AdvertisementState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
  }) =>
      AdvertisementState(
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
