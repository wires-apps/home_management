import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/routes/router.dart';

void initNavigationModule() {
  getIt.registerLazySingleton(() => AppRouter());
}
