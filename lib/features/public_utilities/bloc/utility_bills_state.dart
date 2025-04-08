part of 'utility_bills_bloc.dart';

class UtilityBillsState extends BaseState {
  const UtilityBillsState({
    required super.status,
    super.dialogInfo,
    this.debts,
  });

  final List<DebtItemResponse>? debts;

  @override
  UtilityBillsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    List<DebtItemResponse>? debts,
  }) =>
      UtilityBillsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        debts: debts ?? this.debts,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        debts,
      ];
}
