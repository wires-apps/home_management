part of 'new_announcement_bloc.dart';

class NewAnnouncementState extends BaseState {
  final bool hasAnnouncement;
  final File? image;
  final bool isButtonEnabled;

  const NewAnnouncementState({
    required super.status,
    super.dialogInfo,
    this.image,
    this.hasAnnouncement = false,
    this.isButtonEnabled = false,
  });

  @override
  NewAnnouncementState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    File? image,
    bool? hasAnnouncement,
    bool? isButtonEnabled,
  }) =>
      NewAnnouncementState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        image: image ?? this.image,
        hasAnnouncement: hasAnnouncement ?? this.hasAnnouncement,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        status,
        image,
        hasAnnouncement,
        isButtonEnabled,
      ];
}
