import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/notification/api/notification_api.dart';
import 'package:home_management/features/notification/bloc/notification_bloc.dart';

void initNotificationModule() {
  getIt.registerLazySingleton(
    () => NotificationApi(
      getIt<MainDio>().dio,
    ),
  );

  getIt.registerFactory(() => NotificationBloc(getIt()));
}
