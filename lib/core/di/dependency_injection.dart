import 'package:get_it/get_it.dart';
import 'package:home_management/core/di/complaint_injection.dart';
import 'package:home_management/core/routes/di/navigation_module.dart';

final GetIt getIt = GetIt.instance;

void initDependencyInjection() {
  initNavigationModule();
  initComplaint();
}
