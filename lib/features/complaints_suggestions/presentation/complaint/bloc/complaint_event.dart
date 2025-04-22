part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends BaseEvent {
  const ComplaintEvent();

  @override
  List<Object> get props => [];
}

class ChangePage extends ComplaintEvent {
  const ChangePage(this.page);

  final ComplaintScreenType page;

  @override
  List<Object> get props => [page];
}

class DownloadComplaints extends ComplaintEvent {}
