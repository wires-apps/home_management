import 'package:home_management/api/auth_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/auth/api/auth_api.dart';
import 'package:home_management/features/auth/bloc/auth_bloc.dart';
import 'package:home_management/features/auth/bloc/verification/verify_cubit.dart';
import 'package:home_management/features/auth/interactor/auth_interactor.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';
import 'package:home_management/features/auth/repository/auth_remote_repository.dart';

import '../../features/auth/repository/auth_remote_repository_impl.dart';

void initAuthModule() {
  getIt.registerLazySingleton(
    () => AuthApi(
      getIt<AuthDio>().dio,
      getIt<AuthDio>().dio,
    ),
  );

  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => AuthBloc(
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => VerifyCubit(
      getIt(),
      getIt(),
    ),
  );

  getIt.registerSingleton<AuthInteractor>(
    AuthInteractor(
      getIt<AuthRemoteRepository>(),
      getIt<AuthLocalRepository>(),
    ),
  );
}
