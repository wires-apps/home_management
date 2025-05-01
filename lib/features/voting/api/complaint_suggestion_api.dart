import 'dart:async';

import 'package:dio/dio.dart';
import 'package:home_management/api/base_api.dart';
import 'package:home_management/features/voting/models/polls_response_dto.dart';
import 'package:home_management/features/voting/models/polls_vote_response_dto.dart';
import 'package:home_management/features/voting/models/single_polls_response_dto.dart';

class VoteApi extends BaseApi {
  const VoteApi(Dio dio) : super(dio: dio);

  Future<Response<List<PollsResponseDto>>> getPolls({
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    return callDioGetList(
      path: '/api/polls',
      getData: (list) => list.map((json) => PollsResponseDto.fromJson(json)).toList(),
    );
  }

  Future<Response<SinglePollsResponseDto>> getSinglePoll({
    required int id,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    return callDioGet(
      path: '/api/polls/$id',
      getData: (json) => SinglePollsResponseDto.fromJson(json),
    );
  }

  Future<Response<PollsVoteResponseDto>> sendVote({
    required int idPoll,
    required String vote,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) =>
      callPut(
        path: '/api/polls/$idPoll/vote',
        method: HttpMethod.post,
        queryParam: <String, dynamic>{
          'vote': vote,
        },
        getData: (json) => PollsVoteResponseDto.fromJson(json),
      );
}
