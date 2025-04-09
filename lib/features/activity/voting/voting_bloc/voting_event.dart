part of 'voting_bloc.dart';

abstract class VotingEvent extends BaseEvent {
  const VotingEvent();

  @override
  List<Object> get props => [];
}

class PollsDownload extends VotingEvent {}
