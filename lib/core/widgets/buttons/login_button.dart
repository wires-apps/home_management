import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.c05A84F,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.016,
          horizontal: getValueForScreenType<double>(
            context: context,
            mobile: MediaQuery.of(context).size.width * 0.3,
            tablet: MediaQuery.of(context).size.width * 0.03,
            desktop: 30,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: AutoSizeText(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
