import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaints/complaints_suggestions_page.dart';
import 'package:home_management/generated/l10n.dart';

void showActivityDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                S.of(context).home_screen_activity,
                maxLines: 2,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.c224795,
                ),
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
                const Gap(10),
                ListTileWidget(
                  icon: const Icon(
                    Icons.campaign,
                    color: Colors.amberAccent,
                    size: 30,
                  ),
                  title: S.of(context).activity_advertisement_title,
                  onTap: () {
                    context.pushRoute(const AnnouncementsRoute());
                  },
                ),
                const Gap(10),
                ListTileWidget(
                  icon: const Icon(
                    Icons.poll,
                    color: Colors.yellowAccent,
                    size: 30,
                  ),
                  title: S.of(context).activity_voting_title,
                  onTap: () {
                    context.pushRoute(
                      const VotingRoute(),
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
