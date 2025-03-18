import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaints_suggestions_page.dart';
import 'package:home_management/features/home/bloc/home_bloc.dart';
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
    return Scaffold(
      backgroundColor: AppColors.cE0DEDE,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: const BackButtonAppBarWidget(),
        title: const Text('Мобильный экран'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _NotificationList(),
              _MainButton(_scaffoldKey),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList();

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<PlaylistCubit>();
    // return BlocBuilder<PlaylistCubit, PlaylistState>(
    //   builder: (context, state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.44,
      child: ListView.builder(
        // shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        // physics: const ClampingScrollPhysics(),
        // itemCount: state.timelineElements.length,
        // reverse: true,
        // controller: cubit.daysController,
        itemBuilder: (context, index) {
          // final elements = state.timelineElements;
          // final reversedElements = state.timelineElements.reversed.toList();
          return _NotificationItem(
            mainText: index.toString(),
            secondText: '',
          );
        },
      ),
      // );
      // },
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.mainText,
    required this.secondText,
  });

  final String mainText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.blueAccent,
        splashColor: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          print('I WORKRKRKR');
          context.pushRoute(const NotificationRoute());
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                'notification ' + mainText,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text('data'),
            ],
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
        const Row(children: [
          BackButtonWidget(),
          Gap(0),
        ]),
        _ItemMenu(
          onPressed: () => context.router.push(const UtilityBillsRoute()),
          titleButton: S.of(context).home_screen_payment_communal_service,
          icon: Icons.monetization_on,
        ),
        _ItemMenu(
          onPressed: () => showComplaintDialog(context),
          titleButton: S.of(context).home_screen_complaints_suggestions,
          icon: Icons.feedback,
        ),
        _ItemMenu(
          onPressed: () => context.router.push(const CallMasterRoute()),
          titleButton: S.of(context).home_screen_call_master,
          icon: Icons.construction,
        ),
        _ItemMenu(
          onPressed: () {},
          titleButton: S.of(context).home_screen_knowledge_base,
          icon: Icons.library_books,
        ),
        _ItemMenu(
          onPressed: () {},
          titleButton: S.of(context).home_screen_activity,
          icon: Icons.directions_run,
        ),
        const Gap(30),
      ],
    );
  }
}

class _MainButton extends StatelessWidget {
  const _MainButton(this.scaffoldKey);

  final GlobalKey<ScaffoldState> scaffoldKey;

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
              scaffoldKey.currentState?.showBottomSheet(backgroundColor: Colors.transparent, enableDrag: true,
                  (buildContext) {
                return const CustomBottomSheet(
                  heightFactor: 0.7,
                  backgroundColor: Colors.white,
                  mainWidget: SingleChildScrollView(child: _MenuButtons()),
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

class _ItemMenu extends StatelessWidget {
  const _ItemMenu({
    required this.onPressed,
    required this.titleButton,
    required this.icon,
  });

  final void Function() onPressed;
  final String titleButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04, vertical: MediaQuery.of(context).size.width * 0.01),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.c9EC271,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.026),
              decoration: BoxDecoration(
                color: AppColors.cF7F9F7,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: AppColors.cA5BE76,
                size: 26,
              ),
            ),
            const Gap(10),
            AutoSizeText(
              titleButton,
              minFontSize: 16,
              maxFontSize: 18,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
