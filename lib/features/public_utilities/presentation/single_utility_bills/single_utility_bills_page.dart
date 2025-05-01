import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/features/public_utilities/bloc/single_bloc_debt/single_utility_bill_bloc.dart';

@RoutePage()
class SingleUtilityBillsPage extends StatelessWidget {
  const SingleUtilityBillsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SingleUtilityBillsBloc>()..add(LoadUtilityBillsById(id: id)),
      child: Scaffold(
        floatingActionButton: const _PayButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: AppColors.cEDEDEC,
        appBar: AppBar(
          backgroundColor: AppColors.cEDEDEC,
          surfaceTintColor: AppColors.cEDEDEC,
          title: Text(
            'Оплата комунальных услуг',
            style: AppTextStyle.style.copyWith(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          elevation: 0,
          leading: const BackButtonAppBarWidget(),
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
    return BlocBuilder<SingleUtilityBillsBloc, SingleUtilityBillsState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _AutoTextUtilityBills(
                message: state.debt?.data.dueDate ?? '',
                title: 'Дата выставления счета:',
                icon: Icons.calendar_today_rounded,
              ),
              Gap(MediaQuery.of(context).size.height * 0.04),
              _NameUtilityBills(
                message: state.debt?.data.name ?? '',
              ),
              Gap(MediaQuery.of(context).size.height * 0.04),
              _AutoTextUtilityBills(
                message: state.debt?.data.amount ?? '',
                title: 'К оплате:',
                icon: Icons.payment,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PayButton extends StatelessWidget {
  const _PayButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<SingleUtilityBillsBloc>().add(OpenWindowPayment()),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.c0084EF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
        child: Text(
          'Оплатить',
          style: AppTextStyle.style.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _AutoTextUtilityBills extends StatelessWidget {
  const _AutoTextUtilityBills({
    required this.message,
    required this.title,
    required this.icon,
  });

  final String message;
  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.style.copyWith(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const Gap(10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cE0DEDE, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.c0084EF,
              ),
              const Expanded(child: SizedBox()),
              AutoSizeText(
                message,
                style: AppTextStyle.style.copyWith(
                  fontSize: 22,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}

class _NameUtilityBills extends StatelessWidget {
  const _NameUtilityBills({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Название услуги:',
          style: AppTextStyle.style.copyWith(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const Gap(10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cE0DEDE, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                child: AutoSizeText(
                  message,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.style.copyWith(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
