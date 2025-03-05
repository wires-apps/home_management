import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/complaint/custom_app_bar.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/bloc/complaint_bloc.dart';
import 'package:home_management/features/complaints_suggestions/presentation/suggestion/suggestion_page.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class NewComplaintPage extends StatelessWidget {
  const NewComplaintPage({super.key, required this.page});

  final ComplaintScreenType page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE0DEDE,
      appBar: CustomAppBar(page: page, context: context),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplaintBloc, ComplaintState>(
      bloc: getIt<ComplaintBloc>(),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              GestureDetector(
                onTap: () => context.read<ComplaintBloc>().add(const PickImageEvent(ImageSource.gallery)),
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
              Gap(MediaQuery.of(context).size.height * 0.02),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.c05A84F,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: AppColors.c224795),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text('Добавить', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
