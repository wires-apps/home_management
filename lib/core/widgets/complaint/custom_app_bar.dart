import 'package:flutter/material.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required ComplaintScreenType page,
    required BuildContext context,
  }) : super(
          backgroundColor: AppColors.cE0DEDE,
          surfaceTintColor: AppColors.cE0DEDE,
          title: Text(
            page == ComplaintScreenType.newComplaint
                ? 'new жалобa'
                : page == ComplaintScreenType.complaintDetails
                    ? 'детали жалобы'
                    : 'жалобы',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop
              ? const SizedBox()
              : const BackButtonAppBarWidget(),
        );
}
