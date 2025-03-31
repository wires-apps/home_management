import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: AppColors.cA7BEA6,
        ),
      ),
    );
  }
}
