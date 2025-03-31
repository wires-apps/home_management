part of 'rules_bloc.dart';

abstract class RulesEvent extends BaseEvent {
  const RulesEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends RulesEvent {
  final ImageSource source;

  const PickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class ChangePage extends RulesEvent {
  const ChangePage(this.page);

  final ComplaintScreenType page;

  @override
  List<Object> get props => [page];
}
