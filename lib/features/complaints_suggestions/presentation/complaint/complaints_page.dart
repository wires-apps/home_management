import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/routes/router.dart';
import 'package:home_management/core/widgets/complaint/custom_app_bar.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/bloc/complaint_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class ComplaintsPage extends StatelessWidget {
  const ComplaintsPage({super.key, required this.page});

  final ComplaintScreenType page;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ComplaintBloc>()..add(DownloadComplaint()),
      child: BlocSnackBarListenerWithChild<ComplaintBloc>(
        child: Scaffold(
          backgroundColor: AppColors.cE0DEDE,
          appBar: CustomAppBar(page: page, context: context),
          body: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintBloc, ComplaintState>(
      buildWhen: (prev, curr) =>
          prev.page != curr.page ||
          prev.status != curr.status ||
          prev.image != curr.image ||
          prev.complaints != curr.complaints,
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.c05A84F,
            ),
          );
        }
        final complaints = state.complaints ?? [];
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getValueForScreenType<double>(
            context: context,
            mobile: MediaQuery.of(context).size.width * 0.06,
            tablet: MediaQuery.of(context).size.width * 0.16,
            desktop: MediaQuery.of(context).size.height * 0.4,
          )),
          child: ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              return _UtilityBillItem(
                isOverdue: complaints[index].status == 'pending',
                message: complaints[index].message,
                id: complaints[index].id,
              );
            },
          ),
        );
      },
    );
  }
}

class _UtilityBillItem extends StatelessWidget {
  const _UtilityBillItem({
    required this.isOverdue,
    required this.id,
    this.message,
  });

  final bool isOverdue;
  final String? message;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextButton(
        onPressed: () {
          context.pushRoute(
            ComplaintDetailsRoute(
              id: id,
              page: ComplaintScreenType.complaintDetails,
            ),
          );
        },
        style: TextButton.styleFrom(
          side: const BorderSide(color: Colors.green),
          backgroundColor: AppColors.cF7F9F7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            bottom: isOverdue ? 10 : 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  message ?? 'Жалоба',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(26),
              isOverdue
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.c72A9E1,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.c224795),
                        ),
                        child: const Text(
                          'Рассмотренно',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cF7F9F7,
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
