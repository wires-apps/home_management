part of 'utility_bills_bloc.dart';

abstract class UtilityBillsEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class LoadUtilityBills extends UtilityBillsEvent {}
