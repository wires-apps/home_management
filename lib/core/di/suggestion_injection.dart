import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/complaints_suggestions/presentation/suggestion/bloc/suggestion_bloc.dart';

void initSuggestion() {
  // getIt.registerLazySingleton(
  //   () => ComplaintSuggestionApi(
  //     getIt<MainDio>().dio,
  //   ),
  // );

  // getIt.registerLazySingleton<ComplaintsSuggestionsRemoteRepository>(
  //   () => ComplaintsSuggestionsRemoteRepositoryImpl(
  //     getIt(),
  //   ),
  // );

  getIt.registerFactory<SuggestionBloc>(() => SuggestionBloc(getIt()));
}
