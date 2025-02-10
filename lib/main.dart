import 'package:flutter/material.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/feature/app/app.dart';

void main() {
  initDependencyInjection();
  runApp(App());
}
