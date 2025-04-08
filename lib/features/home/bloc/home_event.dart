part of 'home_bloc.dart';

abstract class HomeEvent extends BaseEvent {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NotificationsDownload extends HomeEvent {
  final bool isFirstFetch;

  const NotificationsDownload({required this.isFirstFetch});

  @override
  List<Object> get props => [isFirstFetch];
}

class LogoutEvent extends HomeEvent {}

class NotificationSendFcmToken extends HomeEvent {}
