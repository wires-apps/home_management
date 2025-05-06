import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/res/app_drawables.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:home_management/core/widgets/svg_asset.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaints/complaints_suggestions_page.dart';
import 'package:home_management/features/home/bloc/home_bloc.dart';
import 'package:home_management/features/home/presentation/notification_list.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../generated/l10n.dart';
import 'desktop_ui/desktop_screen.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => MobileScreen(),
      tablet: (context) => MobileScreen(),
      desktop: (context) => const DesktopScreen(),
    );
  }
}

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(const NotificationsDownload(isFirstFetch: true))
        ..add(NotificationSendFcmToken()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.needToCloseHomePage) {
                context.router.replace(const LoginRoute());
              }
            },
          ),
          BlocSnackBarListener<HomeBloc>(),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.cEDEDEC,
              key: _scaffoldKey,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
                child: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: null,
                  flexibleSpace: SafeArea(
                    child: SvgAsset(
                      drawable: AppDrawables.icWiresHome,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: AppColors.c2261C5,
                    ),
                  ),
                  backgroundColor: AppColors.cEDEDEC,
                  surfaceTintColor: AppColors.cEDEDEC,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Уведомления',
                        style: AppTextStyle.style.copyWith(
                          color: AppColors.c224795,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SingleDropdownList(),
                      const MainMenu(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key, this.controller});

  final PersistentBottomSheetController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.46,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Меню',
            style: AppTextStyle.style.copyWith(
              color: AppColors.c224795,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              ...[
                NewItemMenu(
                  onPressed: () => context.router.push(const UtilityBillsRoute()),
                  titleButton: S.of(context).home_screen_payment_communal_service,
                  icon: Icons.monetization_on,
                ),
                NewItemMenu(
                  onPressed: () => showComplaintDialog(
                    context: context,
                    hideBottomSheet: () => controller?.close(),
                  ),
                  titleButton: S.of(context).home_screen_complaints,
                  icon: Icons.feedback,
                ),
                NewItemMenu(
                  onPressed: () => context.router.push(const KnowledgeBaseCategoriesRoute()),
                  titleButton: S.of(context).home_screen_knowledge_base,
                  icon: Icons.library_books,
                ),
                NewItemMenu(
                  onPressed: () => context.pushRoute(const VotingRoute()),
                  titleButton: S.of(context).activity_voting_title,
                  icon: Icons.poll,
                ),
                NewItemMenu(
                  onPressed: () => context.pushRoute(const AnnouncementsRoute()),
                  titleButton: S.of(context).activity_advertisement_title,
                  icon: Icons.campaign,
                ),
                NewItemMenu(
                  onPressed: () => context.router.push(const CallMasterRoute()),
                  titleButton: S.of(context).home_screen_call_master,
                  icon: Icons.construction,
                ),
                NewItemMenu(
                  onPressed: () => context.pushRoute(const SuggestionRoute()),
                  titleButton: S.of(context).complaints_suggestions_leave_suggestion,
                  icon: Icons.lightbulb,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
