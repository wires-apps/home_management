part of 'announcement_details_bloc.dart';

class AnnouncementDetailsState extends BaseState {
  final AnnouncementDto? announcement;
  final bool deletable;
  final bool needToClose;

  const AnnouncementDetailsState({
    required super.status,
    super.dialogInfo,
    this.announcement,
    this.deletable = false,
    this.needToClose = false,
  });

  @override
  AnnouncementDetailsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    AnnouncementDto? announcement,
    bool? deletable,
    bool? needToClose,
  }) =>
      AnnouncementDetailsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        announcement: announcement ?? this.announcement,
        deletable: deletable ?? this.deletable,
        needToClose: needToClose ?? this.needToClose,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        announcement,
        deletable,
        needToClose,
      ];
}
