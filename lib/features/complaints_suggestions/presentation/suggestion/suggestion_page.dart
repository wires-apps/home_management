import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_button_styles.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/core/widgets/buttons/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'bloc/suggestion_bloc.dart';

@RoutePage()
class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SuggestionBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocSuccessSnackBarListener<SuggestionBloc>(),
          BlocListener<SuggestionBloc, SuggestionState>(
            listenWhen: (prev, curr) => prev.hasSuggestion != curr.hasSuggestion,
            listener: (context, state) {
              if (state.hasSuggestion) {
                Future.delayed(const Duration(milliseconds: 30), () {
                  if (context.mounted) {
                    context.maybePop();
                  }
                });
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
    super.key,
    required BuildContext context,
  }) : super(
          backgroundColor: AppColors.cE0DEDE,
          surfaceTintColor: AppColors.cE0DEDE,
          title: const Text(
            'Новое предложение',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
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
    return BlocBuilder<SuggestionBloc, SuggestionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context.read<SuggestionBloc>().add(const SuggestionPickImageEvent(ImageSource.gallery)),
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
                const _DescriptionField(),
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
  const _SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionBloc, SuggestionState>(
      buildWhen: (prev, curr) => prev.isLoading != curr.isLoading || prev.isButtonEnabled != curr.isButtonEnabled,
      builder: (context, state) {
        return CustomButton(
          onPressed: () => context.read<SuggestionBloc>().add(SuggestionSendToStore()),
          // buttonStyle: TextButton.styleFrom(
          //   backgroundColor: AppColors.c05A84F,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     side: const BorderSide(color: AppColors.c224795),
          //   ),
          // ),
          buttonStyle: AppButtonStyles.actionButtonPrimary,
          text: 'Добавить',
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          isLoading: state.isLoading,
          isEnabled: state.isButtonEnabled,
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SuggestionBloc>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.c224795),
      ),
      child: TextField(
        controller: bloc.textController,
        maxLines: null,
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

class AutoWrapTextField extends StatefulWidget {
  const AutoWrapTextField({super.key});

  @override
  _AutoWrapTextFieldState createState() => _AutoWrapTextFieldState();
}

class _AutoWrapTextFieldState extends State<AutoWrapTextField> {
  final TextEditingController _controller = TextEditingController();

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
        border: Border.all(color: AppColors.c224795),
      ),
      child: TextField(
        controller: _controller,
        maxLines: null,
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
