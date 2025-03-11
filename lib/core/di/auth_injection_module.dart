import 'package:home_management/api/api.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/auth/api/auth_api.dart';
import 'package:home_management/features/auth/bloc/auth_bloc.dart';
import 'package:home_management/features/auth/repository/auth_remote_repository.dart';

import '../../features/auth/repository/auth_remote_repository_impl.dart';

void initAuthModule() {
  getIt.registerLazySingleton(() => AuthApi(getIt<MainDio>().dio));

  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(() => AuthBloc(getIt()));
}
