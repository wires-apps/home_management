part of 'single_voting_bloc.dart';

abstract class SingleVotingEvent extends BaseEvent {
  const SingleVotingEvent();

  @override
  List<Object> get props => [];
}

class VoteChanged extends SingleVotingEvent {
  final String option;

  const VoteChanged({required this.option});

  @override
  List<Object> get props => [option];
}

class VoteLoadById extends SingleVotingEvent {
  final int id;

  const VoteLoadById({required this.id});

  @override
  List<Object> get props => [id];
}
