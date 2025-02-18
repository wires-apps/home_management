import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../res/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.c047839,
        ),
        onPressed: () {
          context.router.maybePop();
        },
      ),
    );
  }
}
