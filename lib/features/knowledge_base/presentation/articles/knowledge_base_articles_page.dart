import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/knowledge_base/bloc/articles/knowledge_base_articles_bloc.dart';

@RoutePage()
class KnowledgeBaseArticlesPage extends StatelessWidget {
  const KnowledgeBaseArticlesPage({super.key, required this.categoryId});

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<KnowledgeBaseArticlesBloc>()..add(KnowledgeBaseArticlesDataLoaded(categoryId: categoryId)),
      child: Scaffold(
        backgroundColor: AppColors.cEDEDEC,
        appBar: AppBar(
          backgroundColor: AppColors.cEDEDEC,
          surfaceTintColor: AppColors.cEDEDEC,
          leading: BackButtonAppBarWidget(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Статьи',
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
    return BlocBuilder<KnowledgeBaseArticlesBloc, KnowledgeBaseArticlesState>(
      buildWhen: (prev, curr) => prev.articles != curr.articles,
      builder: (context, state) {
        final articles = state.articles;
        if (articles == null) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: articles.length,
          // mainAxisSize: MainAxisSize.max,
          itemBuilder: (context, index) {
            final article = articles[index];
            return ItemWidget(
              onPressed: () {
                context.pushRoute(
                  ArticleDetailsRoute(
                    articleId: article.id,
                  ),
                );
              },
              titleButton: article.title,
              needChangePadding: false,
              needChangeMargin: false,
              icon: Icons.article,
            );
            // const Gap(30),
          },
        );
      },
    );
  }
}
