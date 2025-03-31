import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:home_management/core/di/auth_injection_module.dart';
import 'package:home_management/core/di/complaint_injection.dart';
import 'package:home_management/core/di/home_injection_module.dart';
import 'package:home_management/core/di/network_module.dart';
import 'package:home_management/core/di/notification_module.dart';
import 'package:home_management/core/di/talker_injection.dart';
import 'package:home_management/core/di/utility_bills_injection_module.dart';
import 'package:home_management/core/routes/di/navigation_module.dart';
import 'package:home_management/features/auth/repository/auth_local_repository.dart';

import '../../features/auth/repository/auth_local_repository_impl.dart';

final GetIt getIt = GetIt.instance;

Future initDependencyInjection() async {
  getIt.registerSingleton(GlobalKey<ScaffoldMessengerState>());
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<AuthLocalRepository>(AuthLocalRepositoryImpl(getIt<FlutterSecureStorage>()));

  // getIt.registerLazySingletonAsync<SharedPreferences>(
  //   () => SharedPreferences.getInstance(),
  // );
  // await getIt.isReady<SharedPreferences>();
  initNavigationModule();
  initTalker();
  initNetworkModule();
  initAuthModule();
  initComplaint();
  initHomeModule();
  initUtilityBillsModule();
  initNotificationModule();
}
