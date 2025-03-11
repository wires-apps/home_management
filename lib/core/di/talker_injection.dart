import 'package:home_management/core/di/dependency_injection.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void initTalker() {
  final talker = TalkerFlutter.init();
  getIt.registerSingleton<Talker>(talker);
  talker.verbose('Talker initialization completed');

  final talkerDioLogger = TalkerDioLogger(
    talker: talker,
    settings: const TalkerDioLoggerSettings(
      printResponseHeaders: true,
      printRequestHeaders: true,
      printRequestData: true,
      printResponseData: true,
    ),
  );

  getIt.registerSingleton<TalkerDioLogger>(talkerDioLogger);
}
