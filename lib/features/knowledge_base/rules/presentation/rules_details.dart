import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/bloc/complaint_details_bloc.dart';
import 'package:home_management/features/complaints_suggestions/presentation/suggestion/suggestion_page.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class RulesDetailsPage extends StatelessWidget {
  const RulesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ComplaintDetailsBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.cE0DEDE,
        appBar: AppBar(
          title: const Text('Правило'),
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
    return BlocBuilder<ComplaintDetailsBloc, ComplaintDetailsState>(
      bloc: getIt<ComplaintDetailsBloc>(),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => context.read<ComplaintDetailsBloc>().add(
                      const PickImageEvent(ImageSource.gallery),
                    ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.c224795),
                  ),
                  alignment: Alignment.center,
                  child: state.image != null
                      ? InteractiveViewer(
                          panEnabled: true,
                          minScale: 0.5,
                          maxScale: 3.0,
                          child: Image.file(
                            state.image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                      : Icon(
                          Icons.photo_camera,
                          size: 60,
                          color: Colors.grey.shade300,
                        ),
                ),
              ),
              Gap(MediaQuery.of(context).size.height * 0.02),
              const AutoWrapTextField(),
            ],
          ),
        );
      },
    );
  }
}
