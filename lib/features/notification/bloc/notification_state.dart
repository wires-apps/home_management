part of 'notification_bloc.dart';

class NotificationState extends BaseState {
  const NotificationState({
    this.needToCloseDialog = false,
    this.hasReachedMax = false,
    this.item,
    required super.status,
    super.dialogInfo,
  });

  final bool needToCloseDialog;
  final bool hasReachedMax;
  final SingleNotificationResponseDto? item;

  @override
  NotificationState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    bool? needToCloseDialog,
    bool? hasReachedMax,
    SingleNotificationResponseDto? item,
  }) =>
      NotificationState(
        status: status ?? this.status,
        dialogInfo: dialogInfo ?? this.dialogInfo,
        item: item ?? this.item,
        needToCloseDialog: needToCloseDialog ?? this.needToCloseDialog,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        needToCloseDialog,
        item,
        hasReachedMax,
      ];
}
