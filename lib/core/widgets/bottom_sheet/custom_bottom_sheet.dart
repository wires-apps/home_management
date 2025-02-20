import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    this.topLeft,
    this.topRight,
    super.key,
    required this.mainWidget,
    required this.heightFactor,
    this.borderSideColor = Colors.white,
    this.backgroundColor = Colors.grey,
  });

  final Widget mainWidget;
  final double heightFactor;
  final Color borderSideColor;
  final Color backgroundColor;
  final Radius? topLeft;
  final Radius? topRight;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: BottomSheet(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignInside,
              color: borderSideColor,
            ),
            borderRadius: BorderRadius.only(
              topRight: topRight ?? const Radius.circular(20),
              topLeft: topLeft ?? const Radius.circular(20),
            ),
          ),
          enableDrag: false,
          onClosing: () {},
          builder: (context) {
            return mainWidget;
          }),
    );
  }
}
