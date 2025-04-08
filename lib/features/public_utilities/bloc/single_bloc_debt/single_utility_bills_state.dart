part of 'single_utility_bill_bloc.dart';

class SingleUtilityBillsState extends BaseState {
  const SingleUtilityBillsState({
    required super.status,
    super.dialogInfo,
    this.debt,
  });

  final DebtSingleResponse? debt;

  @override
  SingleUtilityBillsState copyWith({
    BaseStatus? status,
    SnackBarInfo? dialogInfo,
    DebtSingleResponse? debt,
  }) =>
      SingleUtilityBillsState(
        status: status ?? this.status,
        dialogInfo: dialogInfo,
        debt: debt ?? this.debt,
      );

  @override
  List<Object?> get props => [...super.props, debt];
}
