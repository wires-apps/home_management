import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/core/widgets/photos/photo_carousel.dart';
import 'package:home_management/features/knowledge_base/bloc/article_details/article_details_bloc.dart';

@RoutePage()
class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({
    super.key,
    required this.articleId,
  });

  final int articleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ArticleDetailsBloc>()..add(ArticleDetailsByIdLoaded(id: articleId)),
      child: Scaffold(
        backgroundColor: AppColors.cEDEDEC,
        appBar: AppBar(
          backgroundColor: AppColors.cEDEDEC,
          surfaceTintColor: AppColors.cEDEDEC,
          leading: BackButtonAppBarWidget(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Статья №$articleId',
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
    return BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              PhotoCarousel(photoUrls: state.article?.photos),
              Gap(MediaQuery.of(context).size.height * 0.03),
              AutoWrapTextField(message: state.article?.content),
            ]),
          ),
        );
      },
    );
  }
}

class AutoWrapTextField extends StatelessWidget {
  const AutoWrapTextField({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: AutoSizeText(
            message ?? '',
            style: AppTextStyle.style.copyWith(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
