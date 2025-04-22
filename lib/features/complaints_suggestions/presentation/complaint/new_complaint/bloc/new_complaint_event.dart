part of 'new_complaint_bloc.dart';

abstract class NewComplaintEvent extends BaseEvent {
  const NewComplaintEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends NewComplaintEvent {
  final ImageSource source;

  const PickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class ChangePage extends NewComplaintEvent {
  const ChangePage(this.page);

  final ComplaintScreenType page;

  @override
  List<Object> get props => [page];
}

class DownloadComplaint extends NewComplaintEvent {}

class SendComplaintStore extends NewComplaintEvent {}

class ComplaintCheckButtonAvailability extends NewComplaintEvent {}
