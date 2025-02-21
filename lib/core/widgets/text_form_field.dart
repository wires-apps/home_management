import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class InputTextField extends StatelessWidget {
  final String? errorText;
  final String hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Function(String? value)? onChanged;
  final Widget? suffixIconButton;

  const InputTextField({
    super.key,
    required this.errorText,
    this.obscureText = false,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
    this.suffixIconButton,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIconButton,
        errorText: errorText,
        errorStyle: const TextStyle(fontSize: 14, color: AppColors.cCE1628),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.cCE1628,
            width: 1.2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: errorText == null ? Colors.grey.shade500 : AppColors.cCE1628,
        ),
        filled: true,
        fillColor: errorText == null ? Colors.grey.shade100 : AppColors.cFEE6EE,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.cA7BEA6,
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.c2A569A,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.c2A569A,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }
}
