part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends BaseEvent {
  const ComplaintEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends ComplaintEvent {
  final ImageSource source;

  const PickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class ChangePage extends ComplaintEvent {
  const ChangePage(this.page);

  final ComplaintScreenType page;

  @override
  List<Object> get props => [page];
}

class DownloadComplaint extends ComplaintEvent {}
