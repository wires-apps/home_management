import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 5,
    this.minLines = 5,
    this.hint,
    this.isReadOnly = false,
  });

  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final String label;
  final String? hint;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      style: AppTextStyle.style.copyWith(fontSize: 18),
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            const Gap(2),
            const Text('*', style: TextStyle(fontSize: 18, color: AppColors.cCE1628)),
          ],
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.c0084EF),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hint,
      ),
    );
  }
}
