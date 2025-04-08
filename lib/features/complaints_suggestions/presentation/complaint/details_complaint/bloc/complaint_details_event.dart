part of 'complaint_details_bloc.dart';

abstract class ComplaintDetailsEvent extends BaseEvent {
  const ComplaintDetailsEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends ComplaintDetailsEvent {
  final ImageSource source;

  const PickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class ChangePage extends ComplaintDetailsEvent {
  const ChangePage(this.page);

  final ComplaintScreenType page;

  @override
  List<Object> get props => [page];
}

class DownloadItemComplaint extends ComplaintDetailsEvent {
  final int id;

  const DownloadItemComplaint({required this.id});

  @override
  List<Object> get props => [id];
}
