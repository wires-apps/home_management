import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/app_colors.dart';

class InputTextField extends StatelessWidget {
  final String? errorText;
  final String? hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Function(String? value)? onChanged;
  final Widget? suffixIconButton;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;

  const InputTextField({
    super.key,
    this.errorText,
    this.obscureText = false,
    required this.controller,
    this.hintText,
    required this.textInputAction,
    this.suffixIconButton,
    this.label,
    this.textInputType,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.c0C3462,
      ),
      controller: controller,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      obscureText: obscureText,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIconButton,
        errorText: errorText,
        errorStyle: const TextStyle(fontSize: 14, color: AppColors.cCE1628),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.cCE1628,
            width: 1.2,
          ),
        ),
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22,
          color: errorText == null ? AppColors.c0C3462 : AppColors.cCE1628,
        ),
        filled: true,
        fillColor: errorText == null ? Colors.grey.shade100 : AppColors.cFEE6EE,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.cA8DEFF,
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.cA8DEFF,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.cA8DEFF,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 12,
        ),
      ),
    );
  }
}
