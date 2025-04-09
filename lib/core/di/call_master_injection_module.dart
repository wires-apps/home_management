import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/call_master/api/call_master_api.dart';
import 'package:home_management/features/call_master/bloc/master_bloc.dart';
import 'package:home_management/features/call_master/repository/call_master_remote_repository.dart';
import 'package:home_management/features/call_master/repository/call_master_remote_repository_impl.dart';

void initCallMasterModule() {
  getIt.registerLazySingleton(
    () => CallMasterApi(
      getIt<MainDio>().dio,
    ),
  );

  getIt.registerLazySingleton<CallMasterRemoteRepository>(
    () => CallMasterRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => CallMasterBloc(getIt()),
  );

}
