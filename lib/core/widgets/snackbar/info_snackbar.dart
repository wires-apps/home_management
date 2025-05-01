import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';

class InfoSnackbar extends StatelessWidget {
  const InfoSnackbar({
    super.key,
    this.title,
    this.message,
    this.color,
  });

  final String? title;
  final String? message;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final title = this.title ?? 'Ошибка';
    final message = this.message;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: color ?? AppColors.c72A9E1.withOpacity(0.85), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          if (message != null)
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  message,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
