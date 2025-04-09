import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/call_master/api/call_master_api.dart';
import 'package:home_management/features/call_master/models/service_request_store_dto.dart';
import 'package:home_management/features/call_master/models/service_response_categories_dto.dart';
import 'package:home_management/features/call_master/models/service_response_store_dto.dart';
import 'package:home_management/features/call_master/repository/call_master_remote_repository.dart';

class CallMasterRemoteRepositoryImpl extends CallMasterRemoteRepository with BaseRepository {
  final CallMasterApi _callMasterApi;

  CallMasterRemoteRepositoryImpl(this._callMasterApi);

  @override
  Future<Either<Failure, List<ServiceResponseStoreItemDto>>> getCategories() =>
      execute(getResponse: () => _callMasterApi.getServiceCategories());

  @override
  Future<Either<Failure, ServiceResponseStoreDto>> callMaster({
    required ServiceRequestStoreDto request,
  }) =>
      execute(getResponse: () => _callMasterApi.callMaster(request: request));
}
