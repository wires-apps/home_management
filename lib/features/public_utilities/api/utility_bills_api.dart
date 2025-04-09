import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/public_utilities/models/debt_single_response.dart';
import 'package:home_management/features/public_utilities/models/debts_data_response_dto.dart';

class UtilityBillsApi extends BaseApi {
  const UtilityBillsApi(Dio dio) : super(dio: dio);

  Future<Response<DebtsDataResponse>> getDebts({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callPut(
        path: r'/api/debts',
        method: HttpMethod.get,
        getData: (json) => DebtsDataResponse.fromJson(json),
      );

  Future<Response<DebtSingleResponse>> getSingleDebt({
    required int id,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callPut(
        path: '/api/debts/$id',
        method: HttpMethod.get,
        getData: (json) => DebtSingleResponse.fromJson(json),
      );
}
