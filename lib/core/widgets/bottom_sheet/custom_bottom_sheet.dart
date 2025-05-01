import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';

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

class NewItemMenu extends StatelessWidget {
  const NewItemMenu({
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
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.01,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
            decoration: BoxDecoration(
              color: AppColors.cF5F5F5,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppColors.c2A569A,
              size: 32,
            ),
          ),
          const Gap(10),
          AutoSizeText(
            titleButton,
            textAlign: TextAlign.center,
            style: AppTextStyle.style.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
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
          backgroundColor: Colors.white,
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
                color: AppColors.cF5F5F5,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: AppColors.c2A569A,
                size: 26,
              ),
            ),
            const Gap(10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: AutoSizeText(
                titleButton,
                maxLines: 2,
                minFontSize: 22,
                maxFontSize: 24,
                style: const TextStyle(
                  color: AppColors.c0C3462,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
