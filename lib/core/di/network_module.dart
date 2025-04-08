import 'package:home_management/api/auth_dio.dart';
import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/network/auth_interceptor.dart';
import 'package:home_management/core/network/error_interceptor.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void initNetworkModule() {
  getIt.registerSingleton<AuthInterceptor>(
    AuthInterceptor(getIt<AuthLocalRepository>()),
  );
  getIt.registerSingleton(ErrorInterceptor(talker: getIt()));
  getIt.registerSingleton<MainDio>(
    MainDio(interceptors: [
      getIt<AuthInterceptor>(),
      getIt<ErrorInterceptor>(),
      getIt<TalkerDioLogger>(),
    ]),
  );
  getIt.registerSingleton<AuthDio>(
    AuthDio(interceptors: [
      getIt<ErrorInterceptor>(),
      getIt<TalkerDioLogger>(),
    ]),
  );
}
