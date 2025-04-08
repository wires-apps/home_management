import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:home_management/features/knowledge_base/bloc/categories/knowledge_base_bloc.dart';

import '../../../../core/res/app_colors.dart';

@RoutePage()
class KnowledgeBaseCategoriesPage extends StatelessWidget {
  const KnowledgeBaseCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<KnowledgeBaseBloc>()..add(KnowledgeBaseDataLoaded()),
      child: Scaffold(
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
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<KnowledgeBaseBloc>();
    return BlocBuilder<KnowledgeBaseBloc, KnowledgeBaseState>(
      buildWhen: (prev, curr) => prev.categories != curr.categories,
      builder: (context, state) {
        final categories = state.categories;
        if (categories == null) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          // mainAxisSize: MainAxisSize.max,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ItemMenu(
              onPressed: () {
                context.pushRoute(KnowledgeBaseArticlesRoute(categoryId: category.id));
              },
              titleButton: category.name,
              needChangePadding: false,
              needChangeMargin: false,
              icon: Icons.account_tree_outlined,
            );
            // const Gap(30),
          },
        );
      },
    );
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    //   child: const Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       _ManualButton(),
    //       Gap(30),
    //       _MenuButtons(),
    //     ],
    //   ),
    // );
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
    final bloc = context.read<KnowledgeBaseBloc>();
    return BlocBuilder<KnowledgeBaseBloc, KnowledgeBaseState>(
      buildWhen: (prev, curr) => prev.categories != curr.categories,
      builder: (context, state) {
        final categories = state.categories;
        if (categories == null) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: categories.length,
          // mainAxisSize: MainAxisSize.max,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ItemMenu(
              onPressed: () => {},
              titleButton: category.name,
              needChangePadding: false,
              needChangeMargin: false,
              icon: Icons.account_tree_outlined,
            );
            // const Gap(30),
          },
        );
      },
    );
  }
}
