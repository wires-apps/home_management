import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/public_utilities/models/debt_single_response.dart';
import 'package:home_management/features/public_utilities/models/debts_data_response_dto.dart';

abstract class UtilityBillsRemoteRepository {
  const UtilityBillsRemoteRepository();

  Future<Either<Failure, DebtsDataResponse>> getUtilityBills();

  Future<Either<Failure, DebtSingleResponse>> getSingleUtilityBills({required int id});
}
