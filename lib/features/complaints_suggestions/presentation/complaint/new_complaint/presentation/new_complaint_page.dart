import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_button_styles.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/custom_button.dart';
import 'package:home_management/core/widgets/complaint/custom_app_bar.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/new_complaint/bloc/new_complaint_bloc.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class NewComplaintPage extends StatelessWidget {
  const NewComplaintPage({super.key, required this.page});

  final ComplaintScreenType page;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewComplaintBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocSuccessSnackBarListener<NewComplaintBloc>(),
          BlocListener<NewComplaintBloc, NewComplaintState>(
            listenWhen: (prev, curr) => prev.hasComplaint != curr.hasComplaint,
            listener: (context, state) {
              if (state.hasComplaint) {
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
          backgroundColor: AppColors.cEDEDEC,
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
    return BlocBuilder<NewComplaintBloc, NewComplaintState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context.read<NewComplaintBloc>().add(const PickImageEvent(ImageSource.gallery)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.c2A569A, width: 1.6),
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
                            color: Colors.grey.shade100,
                          ),
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * 0.02),
                const _AutoWrapTextField(),
                Gap(MediaQuery.of(context).size.height * 0.02),
                const _SendButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewComplaintBloc, NewComplaintState>(
      buildWhen: (prev, curr) => prev.isLoading != curr.isLoading || prev.isButtonEnabled != curr.isButtonEnabled,
      builder: (context, state) {
        return CustomButton(
          onPressed: () => context.read<NewComplaintBloc>().add(SendComplaintStore()),
          buttonStyle: AppButtonStyles.actionButtonPrimary,
          text: 'Добавить',
          textStyle: AppTextStyle.style.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
          isLoading: state.isLoading,
          isEnabled: state.isButtonEnabled,
        );
      },
    );
  }
}

class _AutoWrapTextField extends StatelessWidget {
  const _AutoWrapTextField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.c0084EF, width: 1.6),
      ),
      child: TextField(
        controller: context.read<NewComplaintBloc>().textController,
        maxLines: null,
        style: AppTextStyle.style.copyWith(
          fontSize: 20,
        ),
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Введите текст...",
        ),
      ),
    );
  }
}
