import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/complaint/custom_app_bar.dart';
import 'package:home_management/core/widgets/photos/photo_carousel.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/bloc/complaint_details_bloc.dart';

@RoutePage()
class ComplaintDetailsPage extends StatelessWidget {
  const ComplaintDetailsPage({
    super.key,
    required this.page,
    required this.id,
  });

  final ComplaintScreenType page;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ComplaintDetailsBloc>()..add(DownloadItemComplaint(id: id)),
      child: Scaffold(
        backgroundColor: AppColors.cEDEDEC,
        appBar: CustomAppBar(page: page, context: context),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintDetailsBloc, ComplaintDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              PhotoCarousel(photoUrls: state.complaint?.photos),
              Gap(MediaQuery.of(context).size.height * 0.03),
              AutoWrapTextField(message: state.complaint?.message),
            ]),
          ),
        );
      },
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
            style: AppTextStyle.style.copyWith(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
