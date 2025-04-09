part of 'single_utility_bill_bloc.dart';

abstract class SingleUtilityBillsEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class LoadUtilityBillsById extends SingleUtilityBillsEvent {
  final int id;

  LoadUtilityBillsById({required this.id});

  @override
  List<Object?> get props => [id];
}
class OpenWindowPayment extends SingleUtilityBillsEvent {}
