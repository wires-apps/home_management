part of 'announcement_details_bloc.dart';

abstract class AnnouncementDetailsEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class AnnouncementDetailsDataLoaded extends AnnouncementDetailsEvent {
  final int announcementId;

  AnnouncementDetailsDataLoaded({required this.announcementId});

  @override
  List<Object?> get props => [announcementId];
}

class AnnouncementDelete extends AnnouncementDetailsEvent {}
