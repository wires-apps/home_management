import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/activity/bloc/voting_bloc/voting_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class AdvertisementPage extends StatelessWidget {
  const AdvertisementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => MobileScreen(),
      tablet: (context) => MobileScreen(),
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
        title: const Text('Объявление'),
        backgroundColor: AppColors.cE0DEDE,
        surfaceTintColor: AppColors.cE0DEDE,
      ),
      body: BlocProvider(
        create: (context) => VotingBloc(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _ItemsList(),
              _MainButton(_scaffoldKey),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList();

  @override
  Widget build(BuildContext context) {
    ///TODO возможно добавим пагинацию
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.54,
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
          // context.pushRoute(const NotificationRoute());
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Объявление ' + mainText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class _MainButton extends StatelessWidget {
  const _MainButton(this.scaffoldKey);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VotingBloc, VotingState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.024,
          ),
          child: TextButton(
            onPressed: () {},
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
      },
    );
  }
}
