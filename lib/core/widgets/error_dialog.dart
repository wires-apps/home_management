import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.error, color: Colors.red),
          Gap(10),
          Text('Ошибка'),
        ],
      ),
      content: Text(title ?? 'Произошла ошибка'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}

class FailureImage extends StatelessWidget {
  const FailureImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: const Border(
            top: BorderSide(color: AppColors.cCE1628),
            bottom: BorderSide(color: AppColors.cCE1628),
          )),
      child: const Icon(
        Icons.warning_amber_rounded,
        size: 50,
        color: AppColors.cCE1628,
      ),
    );
  }
}
