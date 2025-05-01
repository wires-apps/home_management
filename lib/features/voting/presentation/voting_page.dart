import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/voting/voting_bloc/voting_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

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
    return BlocProvider(
      create: (context) => getIt<VotingBloc>()..add(PollsDownload()),
      child: MultiBlocListener(
        listeners: [
          BlocSuccessSnackBarListener<VotingBloc>(),
        ],
        child: Scaffold(
          backgroundColor: AppColors.cE0DEDE,
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            leading: const BackButtonAppBarWidget(),
            title: const Text(
              'Голосование',
              style: AppTextStyle.style,
            ),
            backgroundColor: AppColors.cE0DEDE,
            surfaceTintColor: AppColors.cE0DEDE,
          ),
          body: const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 30),
            child: _PollList(),
          ),
        ),
      ),
    );
  }
}

class _PollList extends StatelessWidget {
  const _PollList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VotingBloc, VotingState>(
      buildWhen: (prev, curr) => prev.polls != curr.polls || prev.status != curr.status,
      builder: (context, state) {
        final polls = state.polls;
        if (polls == null) return const Center(child: CircularProgressIndicator());
        if (state.status.isFailure) return const SizedBox();
        return ListView.builder(
          itemCount: state.polls?.length ?? 0,
          itemBuilder: (context, index) {
            return _PollItem(
              mainText: polls[index].title,
              secondText: polls[index].description,
              id: polls[index].id,
            );
          },
        );
      },
    );
  }
}

class _PollItem extends StatelessWidget {
  const _PollItem({
    required this.mainText,
    required this.secondText,
    required this.id,
  });

  final String mainText;
  final String secondText;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.blueAccent,
        splashColor: Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.pushRoute(SingleVoteRoute(id: id));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 36),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.c0084EF, width: 2),
          ),
          child: Text(
            'Голосование $mainText',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: AppColors.c0C3462),
          ),
        ),
      ),
    );
  }
}
