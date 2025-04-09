import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/generated/l10n.dart';

void showActivityDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Активность',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.c224795,
                ),
              ),
            ],
          ),
        ),
        content: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ListTileWidget(
                  icon: const Icon(Icons.poll, color: Colors.yellowAccent),
                  title: S.of(context).activity_voting_title,
                  onTap: () {
                    context.pushRoute(
                      const VotingRoute(),
                    );
                  },
                ),
                const Gap(20),
                _ListTileWidget(
                  icon: const Icon(Icons.campaign, color: Colors.amberAccent),
                  title: S.of(context).activity_advertisement_title,
                  onTap: () {
                    context.pushRoute(const AnnouncementsRoute());
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

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
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
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      onTap: onTap,
    );
  }
}
