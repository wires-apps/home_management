import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/call_master/models/service_request_store_dto.dart';
import 'package:home_management/features/call_master/models/service_response_categories_dto.dart';
import 'package:home_management/features/call_master/models/service_response_store_dto.dart';

abstract class CallMasterRemoteRepository {
  Future<Either<Failure, List<ServiceResponseStoreItemDto>>> getCategories();

  Future<Either<Failure, ServiceResponseStoreDto>> callMaster({
    required ServiceRequestStoreDto request,
  });
}
