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
        backgroundColor: AppColors.cE0DEDE,
        appBar: AppBar(
          backgroundColor: AppColors.cE0DEDE,
          surfaceTintColor: AppColors.cE0DEDE,
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
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AutoWrapTextField(
                  message: state.debt?.data.dueDate,
                ),
                Gap(MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Услуга: \n${state.debt?.data.name ?? ''}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.c05A84F,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * 0.04),
                Text(
                  'К оплате : ${state.debt?.data.amount ?? '0'}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cCE1628,
                  ),
                ),
              ],
            ),
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
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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

class AutoWrapTextField extends StatelessWidget {
  const AutoWrapTextField({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: AutoSizeText(
            message ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyle.style,
          ),
        ),
      ),
    );
  }
}
