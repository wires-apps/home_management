import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.buttonStyle,
    required this.textStyle,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.onPressed,
    required this.isLoading,
    this.isEnabled = true,
  });

  final String? text;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double? marginLeft;
  final double? marginTop;
  final double? marginRight;
  final double? marginBottom;
  final Function()? onPressed;
  final bool isLoading;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(marginLeft ?? 16, marginTop ?? 16, marginRight ?? 16, marginBottom ?? 16),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: buttonStyle,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              )
            : Text(
                text ?? 'Сохранить',
                style: textStyle ?? const TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
