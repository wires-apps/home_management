part of 'announcements_bloc.dart';

class AnnouncementsState extends BaseState {
  final List<AnnouncementDto>? announcements;

  const AnnouncementsState({
    required super.status,
    super.dialogInfo,
    this.announcements,
  });

  @override
  AnnouncementsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    List<AnnouncementDto>? announcements,
  }) =>
      AnnouncementsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        announcements: announcements ?? this.announcements,
      );

  @override
  List<Object?> get props => [
        status,
        dialogInfo,
        announcements,
      ];
}
