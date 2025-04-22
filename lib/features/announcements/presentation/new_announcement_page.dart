import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_button_styles.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/core/widgets/buttons/custom_button.dart';
import 'package:home_management/core/widgets/input/text_input_field.dart';
import 'package:home_management/core/widgets/photos/pick_photo_widget.dart';
import 'package:home_management/features/announcements/bloc/new_announcement/new_announcement_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class NewAnnouncementPage extends StatelessWidget {
  const NewAnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewAnnouncementBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocSuccessSnackBarListener<NewAnnouncementBloc>(),
          BlocListener<NewAnnouncementBloc, NewAnnouncementState>(
            listenWhen: (prev, curr) => prev.hasAnnouncement != curr.hasAnnouncement,
            listener: (context, state) {
              if (state.hasAnnouncement) {
                Future.delayed(const Duration(milliseconds: 30), () {
                  if (context.mounted) {
                    context.maybePop(true);
                  }
                });
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.cEDEDEC,
          appBar: _AppBar(context: context),
          floatingActionButton: const _SendButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            'Новое объявление',
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
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(16),
            _TitleField(),
            Gap(16),
            _MessageField(),
            Gap(16),
            _PhotoWidget(),
            Gap(92),
          ],
        ),
      ),
    );
  }
}

class _PhotoWidget extends StatelessWidget {
  const _PhotoWidget();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewAnnouncementBloc>();
    return BlocBuilder<NewAnnouncementBloc, NewAnnouncementState>(
      builder: (context, state) {
        return PickPhotoWidget(
          onTap: () => bloc.add(const NewAnnouncementPickImageEvent(ImageSource.gallery)),
          image: state.image,
        );
      },
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAnnouncementBloc, NewAnnouncementState>(
      buildWhen: (prev, curr) => prev.status != curr.status || prev.isButtonEnabled != curr.isButtonEnabled,
      builder: (context, state) {
        return CustomButton(
          onPressed: () => context.read<NewAnnouncementBloc>().add(NewAnnouncementSendToStore()),
          buttonStyle: AppButtonStyles.actionButtonPrimary,
          text: 'Добавить',
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          isLoading: state.status.isLoading,
          isEnabled: state.isButtonEnabled,
        );
      },
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewAnnouncementBloc>();
    return TextInputField(
      controller: bloc.titleController,
      label: 'Название темы',
      minLines: 1,
      maxLines: 2,
      hint: "Введите название...",
    );
  }
}

class _MessageField extends StatelessWidget {
  const _MessageField();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewAnnouncementBloc>();
    return TextInputField(
      controller: bloc.messageController,
      label: 'Описание',
      hint: "Введите описание...",
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
