import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 34,
        width: 34,
        child: CircularProgressIndicator(
          color: AppColors.c05A84F,
        ),
      ),
    );
  }
}
