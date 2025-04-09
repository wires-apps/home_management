part of 'announcements_bloc.dart';

abstract class AnnouncementsEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class AnnouncementsDataLoaded extends AnnouncementsEvent {}
