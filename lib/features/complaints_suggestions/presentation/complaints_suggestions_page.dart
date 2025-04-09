import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/generated/l10n.dart';

void showComplaintDialog({
  required BuildContext context,
  required VoidCallback hideBottomSheet,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).complaints_suggestions_title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.c224795,
              ),
            ),
          ],
        ),
        content: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTileWidget(
                  icon: const Icon(Icons.report, color: Colors.red),
                  title: S.of(context).complaints_suggestions_leave_complaint,
                  onTap: () {
                    context.pushRoute(
                      NewComplaintRoute(page: ComplaintScreenType.newComplaint),
                    );
                  },
                ),
                const Gap(10),
                ListTileWidget(
                  icon: const Icon(Icons.list_alt, color: Colors.blue),
                  title: S.of(context).complaints_suggestions_current_complaints,
                  onTap: () {
                    context.pushRoute(
                      ComplaintsRoute(page: ComplaintScreenType.complaints),
                    );
                  },
                ),
                const Gap(10),
                ListTileWidget(
                  icon: const Icon(Icons.lightbulb, color: Colors.yellowAccent),
                  title: S.of(context).complaints_suggestions_leave_suggestion,
                  onTap: () {
                    context.maybePop();
                    hideBottomSheet();
                    context.pushRoute(
                      const SuggestionRoute(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.c9EC271,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
