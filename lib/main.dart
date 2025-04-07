import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/app/app.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initDependencyInjection();
  runApp(const App());
}
