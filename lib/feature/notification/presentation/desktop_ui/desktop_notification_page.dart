import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';

class DesktopNotificationPage extends StatelessWidget {
  const DesktopNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE9F0E8,
      appBar: AppBar(
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
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxHeight = constraints.maxHeight * 0.74;
        double minHeight = 100;

        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.16,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          width: constraints.maxWidth * 0.7,
          height: maxHeight.clamp(minHeight, maxHeight), // Ограничение
          child: Row(
            children: [
              const SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.3,
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
              const Gap(100),
              Expanded(
                flex: 2,
                child: _TextWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: const AutoSizeText(
        'Введите текст уведомления...',
      ),
    );
  }
}
