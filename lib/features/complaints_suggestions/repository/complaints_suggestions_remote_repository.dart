import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_response_dto.dart';

abstract class ComplaintsSuggestionsRemoteRepository {
  Future<Either<Failure, List<SingleComplaintResponseDto>>> getComplaints();

  Future<Either<Failure, SingleComplaintResponseDto>> getSingleComplaint({required int id});

  Future<Either<Failure, ComplaintStoreResponseDto>> sendComplaintStore({
    required ComplaintStoreRequestDto request,
  });

  Future<Either<Failure, SuggestionStoreResponseDto>> sendSuggestion({
    required SuggestionStoreRequestDto request,
  });
}
