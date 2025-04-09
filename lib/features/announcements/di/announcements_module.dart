import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/announcements/api/announcements_api.dart';
import 'package:home_management/features/announcements/bloc/announcement_details/announcement_details_bloc.dart';
import 'package:home_management/features/announcements/bloc/announcements/announcements_bloc.dart';
import 'package:home_management/features/announcements/bloc/new_announcement/new_announcement_bloc.dart';
import 'package:home_management/features/announcements/repository/announcements_remote_repository.dart';
import 'package:home_management/features/announcements/repository/announcements_remote_repository_impl.dart';

void initAnnouncementsModule() {
  getIt.registerLazySingleton(() => AnnouncementsApi(dio: getIt<MainDio>().dio));
  getIt.registerLazySingleton<AnnouncementsRemoteRepository>(() => AnnouncementsRemoteRepositoryImpl(api: getIt()));
  getIt.registerFactory(() => AnnouncementsBloc(repository: getIt()));
  getIt.registerFactory(() => NewAnnouncementBloc(repository: getIt()));
  getIt.registerFactory(() => AnnouncementDetailsBloc(repository: getIt()));
}
