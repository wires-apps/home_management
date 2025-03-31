import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';

import '../../../core/res/app_colors.dart';

@RoutePage()
class KnowledgeBasePage extends StatelessWidget {
  const KnowledgeBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE0DEDE,
      appBar: AppBar(
        backgroundColor: AppColors.cE0DEDE,
        surfaceTintColor: AppColors.cE0DEDE,
        title: const Text(
          'База знаний',
          style: TextStyle(color: AppColors.c2A569A),
        ),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          _ManualButton(),
          Gap(30),
          _MenuButtons(),
        ],
      ),
    );
  }
}

class _ManualButton extends StatelessWidget {
  const _ManualButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.c05A84F,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.03),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () => context.router.push(const RulesRoute()),
        child: const Text(
          'Общие правила',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class _MenuButtons extends StatelessWidget {
  const _MenuButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ItemMenu(
          onPressed: () {},
          titleButton: 'Категория 1 ',
          needChangePadding: false,
          needChangeMargin: false,
          icon: Icons.account_tree_outlined,
        ),
        ItemMenu(
          onPressed: () {},
          titleButton: 'Категория 2 ',
          needChangeMargin: false,
          needChangePadding: false,
          icon: Icons.dashboard_customize_outlined,
        ),
        ItemMenu(
          onPressed: () {},
          titleButton: 'Категория 3 ',
          icon: Icons.category_outlined,
          needChangeMargin: false,
          needChangePadding: false,
        ),
        const Gap(30),
      ],
    );
  }
}
