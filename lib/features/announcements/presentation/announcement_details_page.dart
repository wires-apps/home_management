import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/core/widgets/input/text_input_field.dart';
import 'package:home_management/core/widgets/photos/photo_carousel.dart';
import 'package:home_management/features/announcements/bloc/announcement_details/announcement_details_bloc.dart';

@RoutePage()
class AnnouncementDetailsPage extends StatelessWidget {
  const AnnouncementDetailsPage({super.key, required this.announcementId});

  final int announcementId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AnnouncementDetailsBloc>()..add(AnnouncementDetailsDataLoaded(announcementId: announcementId)),
      child: Scaffold(
        backgroundColor: AppColors.cE0DEDE,
        appBar: AppBar(
          leading: const BackButtonAppBarWidget(),
          title: Text('Объявление №$announcementId'),
          backgroundColor: AppColors.cE0DEDE,
          surfaceTintColor: AppColors.cE0DEDE,
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
    return BlocBuilder<AnnouncementDetailsBloc, AnnouncementDetailsState>(
      builder: (context, state) {
        if (state.status.isLoading) return const Center(child: CircularProgressIndicator());
        final announcement = state.announcement;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Gap(16),
              _TitleField(title: announcement?.title),
              Gap(16),
              _MessageField(content: announcement?.content),
              Gap(16),
              PhotoCarousel(photoUrls: announcement?.photos),
              Gap(92),
            ]),
          ),
        );
      },
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: TextEditingController(text: title ?? ''),
      label: 'Название темы',
      minLines: 1,
      maxLines: 2,
      isReadOnly: true,
    );
  }
}

class _MessageField extends StatelessWidget {
  const _MessageField({super.key, this.content});

  final String? content;

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: TextEditingController(text: content ?? ''),
      label: 'Описание',
      isReadOnly: true,
    );
  }
}
