import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/activity/presentation/activity_dialog.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaints_suggestions_page.dart';
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
      child: BlocSnackBarListenerWithChild<HomeBloc>(
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.needToCloseHomePage) {
              context.router.replace(const LoginRoute());
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.cE0DEDE,
                key: _scaffoldKey,
                appBar: AppBar(
                  leading: BackButtonAppBarWidget(
                    onPressed: () => context.read<HomeBloc>().add(LogoutEvent()),
                  ),
                  title: const Text('Мобильный экран'),
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SingleDropdownList(),
                        Gap(MediaQuery.of(context).size.height * 0.2),
                        _MainButton(_scaffoldKey),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MenuButtons extends StatelessWidget {
  const _MenuButtons({this.controller});

  final PersistentBottomSheetController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Row(
          children: [
            BackButtonWidget(),
            Gap(0),
          ],
        ),
        ItemMenu(
          onPressed: () => context.router.push(const UtilityBillsRoute()),
          titleButton: S.of(context).home_screen_payment_communal_service,
          icon: Icons.monetization_on,
        ),
        ItemMenu(
          onPressed: () => showComplaintDialog(context: context, hideBottomSheet: () => controller?.close()),
          titleButton: S.of(context).home_screen_complaints_suggestions,
          icon: Icons.feedback,
        ),
        ItemMenu(
          onPressed: () => context.router.push(const CallMasterRoute()),
          titleButton: S.of(context).home_screen_call_master,
          icon: Icons.construction,
        ),
        ItemMenu(
          onPressed: () => context.router.push(const KnowledgeBaseRoute()),
          titleButton: S.of(context).home_screen_knowledge_base,
          icon: Icons.library_books,
        ),
        ItemMenu(
          onPressed: () => showActivityDialog(context),
          titleButton: S.of(context).home_screen_activity,
          icon: Icons.directions_run,
        ),
        const Gap(30),
      ],
    );
  }
}

class _MainButton extends StatelessWidget {
  _MainButton(this.scaffoldKey);

  final GlobalKey<ScaffoldState> scaffoldKey;
  PersistentBottomSheetController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.024),
          child: TextButton(
            onPressed: () {
              controller = scaffoldKey.currentState
                  ?.showBottomSheet(backgroundColor: Colors.transparent, enableDrag: true, (buildContext) {
                return CustomBottomSheet(
                  heightFactor: 0.7,
                  backgroundColor: Colors.white,
                  mainWidget: SingleChildScrollView(child: _MenuButtons(controller: controller)),
                );
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.c9EC271,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.024,
                horizontal: MediaQuery.of(context).size.height * 0.02,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}
