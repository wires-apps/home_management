import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/public_utilities/api/utility_bills_api.dart';
import 'package:home_management/features/public_utilities/bloc/single_bloc_debt/single_utility_bill_bloc.dart';
import 'package:home_management/features/public_utilities/bloc/utility_bills_bloc.dart';
import 'package:home_management/features/public_utilities/repository/utility_bills_remote_repository.dart';
import 'package:home_management/features/public_utilities/repository/utility_bills_remote_repository_impl.dart';

void initUtilityBillsModule() {
  getIt.registerLazySingleton(
    () => UtilityBillsApi(
      getIt<MainDio>().dio,
    ),
  );

  getIt.registerLazySingleton<UtilityBillsRemoteRepository>(
    () => UtilityBillsRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => UtilityBillsBloc(getIt()),
  );

  getIt.registerFactory(
    () => SingleUtilityBillsBloc(getIt()),
  );
}
