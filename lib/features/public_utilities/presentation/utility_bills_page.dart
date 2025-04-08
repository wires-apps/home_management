import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/core/widgets/loader.dart';
import 'package:home_management/features/public_utilities/bloc/utility_bills_bloc.dart';
import 'package:home_management/features/public_utilities/models/debt_item_response.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class UtilityBillsPage extends StatelessWidget {
  const UtilityBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UtilityBillsBloc>()..add(LoadUtilityBills()),
      child: const BlocSnackBarListenerWithChild<UtilityBillsBloc>(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE0DEDE,
      appBar: AppBar(
        backgroundColor: AppColors.cE0DEDE,
        surfaceTintColor: AppColors.cE0DEDE,
        title: const Text('Oplata'),
        centerTitle: true,
        elevation: 0,
        leading: getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop
            ? const SizedBox()
            : const BackButtonAppBarWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getValueForScreenType<double>(
          context: context,
          mobile: MediaQuery.of(context).size.width * 0.06,
          tablet: MediaQuery.of(context).size.width * 0.16,
          desktop: MediaQuery.of(context).size.height * 0.4,
        )),
        child: BlocBuilder<UtilityBillsBloc, UtilityBillsState>(builder: (context, state) {
          final List<DebtSingleItemResponse> items = state.debts ?? [];
          final bloc = context.read<UtilityBillsBloc>();

          if (items.isEmpty && state.status.isSuccess) {
            return const Center(
              child: AutoSizeText(
                'Коммунальные услуги отсутствуют',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.c2A569A,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          if (items.isEmpty && !state.status.isFailure) {
            return const Loader();
          }

          return ListView.builder(
            itemCount: items.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (state.status.isFailure) {
                return const SizedBox();
              }

              return _UtilityBillItem(
                isOverdue: items[index].overdue,
                name: items[index].name,
                amount: items[index].amount,
              );
            },
          );
        }),
      ),
    );
  }
}

class _UtilityBillItem extends StatelessWidget {
  const _UtilityBillItem({
    required this.isOverdue,
    required this.name,
    required this.amount,
  });

  final bool isOverdue;
  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.green),
          backgroundColor: AppColors.cF7F9F7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, bottom: isOverdue ? 10 : 30, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Сумма : $amount',
                style: TextStyle(fontSize: 16),
              ),
              isOverdue
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cFEE6EE,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red),
                        ),
                        child: const Text(
                          'Просрочено',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cCE1628,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
