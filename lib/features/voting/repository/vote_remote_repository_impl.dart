import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/core/repository/base_repository.dart';
import 'package:home_management/features/voting/api/complaint_suggestion_api.dart';
import 'package:home_management/features/voting/models/polls_response_dto.dart';
import 'package:home_management/features/voting/models/polls_vote_response_dto.dart';
import 'package:home_management/features/voting/repository/vote_remote_repository.dart';

import '../models/single_polls_response_dto.dart';

class VoteRemoteRepositoryImpl extends VoteRemoteRepository with BaseRepository {
  final VoteApi _api;

  VoteRemoteRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<PollsResponseDto>>> getPolls() => execute(getResponse: () => _api.getPolls());

  @override
  Future<Either<Failure, SinglePollsResponseDto>> getSingleVote({
    required int id,
  }) =>
      execute(
        getResponse: () => _api.getSinglePoll(
          id: id,
        ),
      );

  @override
  Future<Either<Failure, PollsVoteResponseDto>> sendVote({
    required int idPoll,
    required String vote,
  }) =>
      execute(
        getResponse: () => _api.sendVote(
          idPoll: idPoll,
          vote: vote,
        ),
      );
}
