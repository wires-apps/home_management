import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/announcements/bloc/announcements/announcements_bloc.dart';
import 'package:home_management/features/announcements/models/announcement_dto.dart';

@RoutePage()
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnnouncementsBloc>()..add(AnnouncementsDataLoaded()),
      child: Scaffold(
        backgroundColor: AppColors.cE0DEDE,
        appBar: AppBar(
          leading: const BackButtonAppBarWidget(),
          title: const Text(
            'Объявления',
            style: AppTextStyle.style,
          ),
          backgroundColor: AppColors.cE0DEDE,
          surfaceTintColor: AppColors.cE0DEDE,
        ),
        floatingActionButton: const _MainButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const _ItemsList(),
      ),
    );
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementsBloc, AnnouncementsState>(
      buildWhen: (prev, curr) => prev.announcements != curr.announcements,
      builder: (context, state) {
        final announcements = state.announcements;
        if (announcements == null) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (context, index) {
            final announcement = announcements[index];
            return _AnnouncementItem(announcement: announcement);
          },
        );
      },
    );
  }
}

class _AnnouncementItem extends StatelessWidget {
  const _AnnouncementItem({
    required this.announcement,
  });

  final AnnouncementDto announcement;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.blueAccent,
        splashColor: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.pushRoute(AnnouncementDetailsRoute(announcementId: announcement.id));
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.c0084EF),
          ),
          child: Text(
            announcement.title,
            textAlign: TextAlign.center,
            style: AppTextStyle.style.copyWith(
              fontSize: 20,
              color: AppColors.c224795,
            ),
          ),
        ),
      ),
    );
  }
}

class _MainButton extends StatelessWidget {
  const _MainButton();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AnnouncementsBloc>();
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.03,
        vertical: MediaQuery.of(context).size.height * 0.024,
      ),
      child: TextButton(
        onPressed: () {
          context.pushRoute(const NewAnnouncementRoute()).then((value) {
            if (value is bool && value) {
              bloc.add(AnnouncementsDataLoaded());
            }
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.c9EC271,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.016,
            horizontal: MediaQuery.of(context).size.height * 0.02,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
