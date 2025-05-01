import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/voting/presentation/single/bloc/single_voting_bloc.dart';
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
          BlocListener<SingleVotingBloc, SingleVotingState>(
            listenWhen: (prev, curr) => prev.isChooseVoting != curr.isChooseVoting,
            listener: (context, state) {
              if (state.isChooseVoting && state.selectedOption != null) {
                showDialog(
                  context: context,
                  builder: (context) => ChooseDialog(selectedOption: state.selectedOption!),
                ).then((value) {
                  if (value == null && context.mounted) {
                    context.read<SingleVotingBloc>().add(const ChooseVoice(isChoose: false));
                  }
                  if (value != null && context.mounted) {
                    context.read<SingleVotingBloc>().add(ChooseVoice(isChoose: value));
                  }
                });
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.cEDEDEC,
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
          backgroundColor: AppColors.cEDEDEC,
          surfaceTintColor: AppColors.cEDEDEC,
          title: const Text(
            'Тема Голосования:',
            style: AppTextStyle.style,
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
                const _VoteOptions()
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
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.c0084EF),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      child: SingleChildScrollView(
        child: Text(
          message,
          style: AppTextStyle.style.copyWith(fontSize: 20),
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
      AppColors.c05A84F,
      AppColors.c0084EF,
      AppColors.c0C3462,
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
          legendOptions: LegendOptions(
            showLegends: true,
            legendTextStyle: AppTextStyle.style.copyWith(fontSize: 18),
            legendPosition: LegendPosition.left,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Всего голосов: $total',
          style: AppTextStyle.style.copyWith(fontSize: 20),
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
          'Да': AppColors.c05A84F, // Зеленый для "Да"
          'Нет': AppColors.c0084EF, // Красный для "Нет"
          'Воздержаться': AppColors.c0C3462, // Серый для "Нейтрал"
        };
        return Column(
          children: options.map((option) {
            return RadioListTile<String>(
              dense: true,
              title: Text(
                option,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: optionColors[option],
                ),
              ),
              value: option,
              groupValue: state.selectedOption,
              onChanged: (value) => context.read<SingleVotingBloc>().add(VoteChanged(option: value!)),
              activeColor: optionColors[option],
              controlAffinity: ListTileControlAffinity.trailing,
            );
          }).toList(),
        );
      },
    );
  }
}

class ChooseDialog extends StatelessWidget {
  const ChooseDialog({super.key, required this.selectedOption});

  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.where_to_vote_outlined, color: AppColors.c0084EF),
          Gap(10),
          Text(
            'Вы проголосовали!',
            style: TextStyle(fontSize: 24, color: AppColors.c0C3462),
          ),
        ],
      ),
      content: const Text(
        'Вы уверены в своем голосе?',
        maxLines: 3,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: AppColors.c0C3462,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text(
            'Да',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.c0C3462,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text(
            'Нет',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.c0C3462,
            ),
          ),
        ),
      ],
    );
  }
}
