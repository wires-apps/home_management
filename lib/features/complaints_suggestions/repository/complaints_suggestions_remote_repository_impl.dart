import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/complaints_suggestions/api/complaint_suggestion_api.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/complaint_store_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_request_dto.dart';
import 'package:home_management/features/complaints_suggestions/models/suggestion_store_response_dto.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository.dart';

class ComplaintsSuggestionsRemoteRepositoryImpl extends ComplaintsSuggestionsRemoteRepository with BaseRepository {
  final ComplaintSuggestionApi _api;

  ComplaintsSuggestionsRemoteRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<SingleComplaintResponseDto>>> getComplaints() => execute(
        getResponse: () => _api.getComplaints(),
      );

  @override
  Future<Either<Failure, SingleComplaintResponseDto>> getSingleComplaint({
    required int id,
  }) =>
      execute(
        getResponse: () => _api.getSingleComplaint(
          id: id,
        ),
      );

  @override
  Future<Either<Failure, ComplaintStoreResponseDto>> sendComplaintStore({
    required ComplaintStoreRequestDto request,
  }) =>
      execute(
        getResponse: () => _api.sendComplaintStore(
          request: request,
        ),
      );

  @override
  Future<Either<Failure, SuggestionStoreResponseDto>> sendSuggestion({required SuggestionStoreRequestDto request}) {
    return execute(
      getResponse: () => _api.sendSuggestion(
        request: request,
      ),
    );
  }
}
