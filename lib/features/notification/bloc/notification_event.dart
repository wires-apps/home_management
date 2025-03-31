part of 'notification_bloc.dart';

abstract class NotificationEvent extends BaseEvent {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationDownload extends NotificationEvent {
  final int id;

  const NotificationDownload({required this.id});

  @override
  List<Object> get props => [id];
}

class NotificationOpenPdfUrl extends NotificationEvent {
  final String url;

  const NotificationOpenPdfUrl({required this.url});

  @override
  List<Object> get props => [url];
}
