import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
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
        backgroundColor: AppColors.cEDEDEC,
        appBar: AppBar(
          backgroundColor: AppColors.cEDEDEC,
          surfaceTintColor: AppColors.cEDEDEC,
          leading: BackButtonAppBarWidget(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'База знаний',
            style: AppTextStyle.style.copyWith(fontSize: 24),
          ),
          centerTitle: true,
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
    return BlocBuilder<KnowledgeBaseBloc, KnowledgeBaseState>(
      buildWhen: (prev, curr) => prev.categories != curr.categories,
      builder: (context, state) {
        final categories = state.categories;
        if (categories == null) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ItemWidget(
              onPressed: () {
                context.pushRoute(KnowledgeBaseArticlesRoute(categoryId: category.id));
              },
              titleButton: category.name,
              needChangePadding: false,
              needChangeMargin: false,
              icon: Icons.account_tree_outlined,
            );
          },
        );
      },
    );
  }
}
