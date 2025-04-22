import 'package:home_management/api/main_dio.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/complaints_suggestions/api/complaint_suggestion_api.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/bloc/complaint_bloc.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/bloc/complaint_details_bloc.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/new_complaint/bloc/new_complaint_bloc.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository.dart';
import 'package:home_management/features/complaints_suggestions/repository/complaints_suggestions_remote_repository_impl.dart';

void initComplaint() {
  getIt.registerLazySingleton(
    () => ComplaintSuggestionApi(
      getIt<MainDio>().dio,
    ),
  );

  getIt.registerLazySingleton<ComplaintsSuggestionsRemoteRepository>(
    () => ComplaintsSuggestionsRemoteRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory<ComplaintBloc>(() => ComplaintBloc(getIt()));
  getIt.registerFactory<NewComplaintBloc>(() => NewComplaintBloc(getIt()));
  getIt.registerFactory<ComplaintDetailsBloc>(() => ComplaintDetailsBloc(getIt()));
}
