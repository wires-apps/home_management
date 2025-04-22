import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../network/error_handling/failures.dart';

mixin BaseRepository {
  final talker = getIt<Talker>();

  Future<Either<Failure, T>> execute<T>({
    required Future<Response<T>> Function() getResponse,
  }) async {
    try {
      final response = await getResponse.call();
      if (response.data != null) {
        return Right(response.data!);
      } else {
        return const Left(DefaultFailure());
      }
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode.toString() ?? ''; // на случий показа статус кода
      talker.error("BaseRepository -> execute() -> on DioError: "
          "\nerror :${e.error}\nresponse: ${e.response}"
          "\n ${e.stackTrace}");
      final error = e.error;
      final data = e.response?.data != null && e.response?.data is Map
          ? e.response?.data as Map<String, dynamic>
          : e.response?.data is String
              ? e.response?.data as String
              : null;
      if (error is SocketException) {
        return const Left(NoInternetConnectionFailure());
      } else {
        return (data != null && data is Map && data.containsKey('message'))
            ? Left(ServerFailure('${data['message']}'))
            : (data != null && data is String)
                ? Left(ServerFailure(data))
                : const Left(DefaultFailure());
      }
    } catch (e) {
      talker.info(('${T.runtimeType} -> _execute: $e \nstatus Code: ${e.runtimeType}'));
      return const Left(DefaultFailure());
    }
  }
}
