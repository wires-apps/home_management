import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/home/bloc/home_bloc.dart';
import 'package:home_management/features/notification/repository/notification_remote_repository.dart';
import 'package:home_management/features/notification/repository/notification_remote_repository_impl.dart';

void initHomeModule() {
  getIt.registerLazySingleton<NotificationRemoteRepository>(
    () => NotificationRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => HomeBloc(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
}
