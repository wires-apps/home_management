import 'package:flutter/material.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required ComplaintScreenType page,
    required BuildContext context,
  }) : super(
          backgroundColor: AppColors.cEDEDEC,
          surfaceTintColor: AppColors.cEDEDEC,
          title: Text(
            page == ComplaintScreenType.newComplaint
                ? 'Новая Жалоба'
                : page == ComplaintScreenType.complaintDetails
                    ? 'Детали жалобы'
                    : 'Жалобы',
            style: AppTextStyle.style,
          ),
          centerTitle: true,
          elevation: 0,
          leading: getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop
              ? const SizedBox()
              : const BackButtonAppBarWidget(),
        );
}
