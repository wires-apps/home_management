import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/feature/complaints_suggestions/presentation/complaints_suggestions_page.dart';
import 'package:home_management/generated/l10n.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desktop экран')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 300,
            child: _SidebarMenu(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.4,
                left: MediaQuery.of(context).size.width * 0.04,
              ),
              color: AppColors.cE9F0E8,
              child: _NotificationList(),
            ),
          ),
        ],
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
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxHeight = constraints.maxHeight * 0.54;
        double minHeight = 100;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: constraints.maxWidth * 0.2,
          height: maxHeight.clamp(minHeight, maxHeight), // Ограничение
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
                secondText: 'data',
              );
            },
          ),
        );
      },
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
          context.pushRoute(const NotificationRoute());
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              AutoSizeText(
                minFontSize: 12,
                mainText,
                style: TextStyle(fontSize: 18, color: Colors.black),
                maxLines: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.024),
                child: Text(secondText, overflow: TextOverflow.ellipsis, maxLines: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.c047839,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Text(
                S.of(context).home_screen_menu,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const ColoredBox(
              color: AppColors.cE9F0E8,
              child: SizedBox(
                height: 1,
                width: double.infinity,
              ),
            ),
            _ItemMenu(
              onPressed: () {
                context.router.push(const UtilityBillsRoute());
              },
              titleButton: S.of(context).home_screen_payment_communal_service,
              icon: Icons.monetization_on,
            ),
            _ItemMenu(
              onPressed: () {
                showComplaintDialog(context);
              },
              titleButton: S.of(context).home_screen_complaints_suggestions,
              icon: Icons.feedback,
            ),
            _ItemMenu(
              onPressed: () {},
              titleButton: S.of(context).home_screen_call_master,
              icon: Icons.construction,
            ),
            _ItemMenu(
              onPressed: () {},
              titleButton: S.of(context).home_screen_knowledge_base,
              icon: Icons.library_books,
            ),
          ],
        ),
      ),
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
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: ListTile(
            leading: Icon(icon, color: Colors.white),
            title: AutoSizeText(
              titleButton,
              style: const TextStyle(
                color: Colors.white,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
