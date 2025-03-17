import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_management/core/bloc/base_bloc.dart';
import 'package:home_management/core/network/error_handling/snack_bar_info.dart';
import 'package:home_management/features/public_utilities/models/debt_item_response.dart';
import 'package:home_management/features/public_utilities/repository/utility_bills_remote_repository.dart';

part 'utility_bills_event.dart';

part 'utility_bills_state.dart';

class UtilityBillsBloc extends Bloc<UtilityBillsEvent, UtilityBillsState> {
  UtilityBillsBloc(this._repository) : super(const UtilityBillsState(status: BaseStatus.success)) {
    on<LoadUtilityBills>(_onLoadUtilityBills);
  }

  final UtilityBillsRemoteRepository _repository;

  Future<void> _onLoadUtilityBills(
    LoadUtilityBills event,
    Emitter<UtilityBillsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await _repository.getUtilityBills();

    response.fold(
      (l) => emit(
        state.copyWith(
          status: BaseStatus.failure,
          dialogInfo: SnackBarInfo.getErrorMessage(l),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: BaseStatus.success,
          debts: r.data,
        ),
      ),
    );
  }
}
