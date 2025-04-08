import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';

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

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    super.key,
    required this.onPressed,
    required this.titleButton,
    required this.icon,
    this.needChangeMargin = true,
    this.needChangePadding = true,
  });

  final void Function() onPressed;
  final String titleButton;
  final IconData icon;
  final bool needChangeMargin;
  final bool needChangePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: needChangeMargin ? MediaQuery.of(context).size.width * 0.04 : 0,
        vertical: MediaQuery.of(context).size.width * (needChangeMargin ? 0.01 : 0.04),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.c9EC271,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * (needChangePadding ? 0.01 : 0.04),
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.026),
              decoration: BoxDecoration(
                color: AppColors.cF7F9F7,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: AppColors.cA5BE76,
                size: 26,
              ),
            ),
            const Gap(10),
            AutoSizeText(
              titleButton,
              minFontSize: 16,
              maxFontSize: 18,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
