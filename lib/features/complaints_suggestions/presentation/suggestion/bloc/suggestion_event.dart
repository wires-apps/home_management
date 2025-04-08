part of 'suggestion_bloc.dart';

abstract class SuggestionEvent extends BaseEvent {
  const SuggestionEvent();

  @override
  List<Object> get props => [];
}

class SuggestionPickImageEvent extends SuggestionEvent {
  final ImageSource source;

  const SuggestionPickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class SuggestionSendToStore extends SuggestionEvent {}

class SuggestionCheckButtonAvailability extends SuggestionEvent {}
