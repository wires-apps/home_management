import 'package:dartz/dartz.dart';
import 'package:home_management/core/network/error_handling/failures.dart';
import 'package:home_management/features/activity/voting/models/polls_response_dto.dart';
import 'package:home_management/features/activity/voting/models/polls_vote_response_dto.dart';
import 'package:home_management/features/activity/voting/models/single_polls_response_dto.dart';

abstract class VoteRemoteRepository {
  Future<Either<Failure, List<PollsResponseDto>>> getPolls();

  Future<Either<Failure, SinglePollsResponseDto>> getSingleVote({required int id});

  Future<Either<Failure, PollsVoteResponseDto>> sendVote({
    required int idPoll,
    required String vote,
  });
}
