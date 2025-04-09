part of 'new_announcement_bloc.dart';

abstract class NewAnnouncementEvent extends BaseEvent {
  const NewAnnouncementEvent();
  @override
  List<Object?> get props => [];
}

class NewAnnouncementPickImageEvent extends NewAnnouncementEvent {
  final ImageSource source;

  const NewAnnouncementPickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class NewAnnouncementSendToStore extends NewAnnouncementEvent {}

class NewAnnouncementCheckButtonAvailability extends NewAnnouncementEvent {}
