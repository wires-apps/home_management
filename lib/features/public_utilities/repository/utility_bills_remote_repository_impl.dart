import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/public_utilities/api/utility_bills_api.dart';
import 'package:home_management/features/public_utilities/models/debt_single_response.dart';
import 'package:home_management/features/public_utilities/models/debts_data_response_dto.dart';
import 'package:home_management/features/public_utilities/repository/utility_bills_remote_repository.dart';

class UtilityBillsRemoteRepositoryImpl extends UtilityBillsRemoteRepository with BaseRepository {
  UtilityBillsRemoteRepositoryImpl(this._utilityBillsApi);

  final UtilityBillsApi _utilityBillsApi;

  @override
  Future<Either<Failure, DebtsDataResponse>> getUtilityBills() => execute(
        getResponse: () => _utilityBillsApi.getDebts(),
      );

  @override
  Future<Either<Failure, DebtSingleResponse>> getSingleUtilityBills({
    required int id,
  }) =>
      execute(
        getResponse: () => _utilityBillsApi.getSingleDebt(
          id: id,
        ),
      );
}
