import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/activity/voting/presentation/single/bloc/single_voting_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class SingleVotePage extends StatelessWidget {
  const SingleVotePage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SingleVotingBloc>()..add(VoteLoadById(id: id)),
      child: MultiBlocListener(
        listeners: [
          BlocSuccessSnackBarListener<SingleVotingBloc>(),
          BlocListener<SingleVotingBloc, SingleVotingState>(
            listenWhen: (prev, curr) => prev.hasVoting != curr.hasVoting,
            listener: (context, state) {
              if (state.hasVoting) {
                Future.delayed(
                  const Duration(milliseconds: 30),
                  () {
                    if (context.mounted) {
                      context.maybePop();
                    }
                  },
                );
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.cE0DEDE,
          appBar: _AppBar(context: context),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _AppBar extends AppBar {
  _AppBar({
    required BuildContext context,
  }) : super(
          backgroundColor: AppColors.cE0DEDE,
          surfaceTintColor: AppColors.cE0DEDE,
          title: const Text(
            'Тема Голосования:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: AppColors.c2A569A,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop
              ? const SizedBox()
              : const BackButtonAppBarWidget(),
        );
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleVotingBloc, SingleVotingState>(
      builder: (context, state) {
        final poll = state.poll?.poll;
        final vote = state.poll?.votes;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  poll?.title ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.c05A84F,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * 0.04),
                _VotingResultChart(
                  yesCount: vote?.yes ?? 0,
                  noCount: vote?.no ?? 0,
                  abstainCount: vote?.abstain ?? 0,
                ),
                Gap(MediaQuery.of(context).size.height * 0.04),
                _AutoWrapTextField(
                  message: poll?.description ?? '',
                ),
                Gap(MediaQuery.of(context).size.height * 0.04),
                _VoteOptions()
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AutoWrapTextField extends StatelessWidget {
  const _AutoWrapTextField({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.c224795),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      child: SingleChildScrollView(
        child: Text(
          message,
          style: const TextStyle(fontSize: 16, color: AppColors.c224795),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _VotingResultChart extends StatelessWidget {
  final int yesCount;
  final int noCount;
  final int abstainCount;

  const _VotingResultChart({
    required this.yesCount,
    required this.noCount,
    required this.abstainCount,
  });

  @override
  Widget build(BuildContext context) {
    final total = yesCount + noCount + abstainCount;

    final dataMap = {
      'Да': yesCount.toDouble(),
      'Нет': noCount.toDouble(),
      'Воздержался': abstainCount.toDouble(),
    };

    final colorList = [
      AppColors.cA7BEA6,
      AppColors.c72A9E1,
      AppColors.c2A569A,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 1100),
          chartRadius: MediaQuery.of(context).size.width / 2.2,
          colorList: colorList,
          chartType: ChartType.disc,
          ringStrokeWidth: 32,
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            decimalPlaces: 1,
          ),
          legendOptions: const LegendOptions(
            showLegends: true,
            legendTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            legendPosition: LegendPosition.left,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Всего голосов: $total',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _VoteOptions extends StatelessWidget {
  const _VoteOptions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleVotingBloc, SingleVotingState>(
      builder: (context, state) {
        final List<String> options = ['Да', 'Нет', 'Воздержаться'];

        final Map<String, Color> optionColors = {
          'Да': AppColors.cA7BEA6, // Зеленый для "Да"
          'Нет': AppColors.c72A9E1, // Красный для "Нет"
          'Воздержаться': AppColors.c2A569A, // Серый для "Нейтрал"
        };
        return Column(
          children: options.map((option) {
            return RadioListTile<String>(
              dense: true,
              title: Text(
                option,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: optionColors[option],
                ),
              ),
              value: option,
              groupValue: state.selectedOption,
              onChanged: (value) => context.read<SingleVotingBloc>().add(VoteChanged(option: value!)),
              // activeColor: Colors.blue,
              activeColor: optionColors[option],
              controlAffinity: ListTileControlAffinity.trailing,
            );
          }).toList(),
        );
      },
    );
  }
}
