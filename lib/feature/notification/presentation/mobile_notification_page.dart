import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/feature/notification/presentation/desktop_ui/desktop_notification_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const MobileNotificationPage(),
      tablet: (context) => const MobileNotificationPage(),
      desktop: (context) => const DesktopNotificationPage(),
    );
  }
}

class MobileNotificationPage extends StatelessWidget {
  const MobileNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE9F0E8,
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: AppColors.cE9F0E8,
        title: const Text(
          'Уведомление',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // elevation: 0,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 04,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Gap(10),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green),
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Text(
                'Введите текст уведомления...',
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
