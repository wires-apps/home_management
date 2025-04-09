import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/activity/voting/api/complaint_suggestion_api.dart';
import 'package:home_management/features/activity/voting/presentation/single/bloc/single_voting_bloc.dart';
import 'package:home_management/features/activity/voting/repository/vote_remote_repository.dart';
import 'package:home_management/features/activity/voting/repository/vote_remote_repository_impl.dart';
import 'package:home_management/features/activity/voting/voting_bloc/voting_bloc.dart';

void initVoteModule() {
  getIt.registerLazySingleton(
    () => VoteApi(
      getIt<MainDio>().dio,
    ),
  );

  getIt.registerLazySingleton<VoteRemoteRepository>(
    () => VoteRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => VotingBloc(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => SingleVotingBloc(
      getIt(),
    ),
  );

  // getIt.registerSingleton<AuthInteractor>(
  //   AuthInteractor(
  //     getIt<AuthRemoteRepository>(),
  //     getIt<AuthLocalRepository>(),
  //   ),
  // );
}
