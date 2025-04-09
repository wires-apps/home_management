import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';

abstract class AppButtonStyles {
  static final actionButtonPrimary = ElevatedButton.styleFrom(
    animationDuration: const Duration(milliseconds: 300),
    minimumSize: const Size.fromHeight(36),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    textStyle: const TextStyle(fontSize: 15, color: Colors.white),
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: AppColors.c05A84F,
    splashFactory: InkRipple.splashFactory,
  );
}
