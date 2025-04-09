part of 'announcement_details_bloc.dart';

class AnnouncementDetailsState extends BaseState {
  final AnnouncementDto? announcement;

  const AnnouncementDetailsState({
    required super.status,
    super.dialogInfo,
    this.announcement,
  });

  @override
  AnnouncementDetailsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    AnnouncementDto? announcement,
  }) =>
      AnnouncementDetailsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        announcement: announcement ?? this.announcement,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        announcement,
      ];
}
