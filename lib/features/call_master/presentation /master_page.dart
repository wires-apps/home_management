import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/features/call_master/bloc/master_bloc.dart';
import 'package:home_management/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CallMasterPage extends StatelessWidget {
  const CallMasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MasterBloc(),
      child: Scaffold(
        backgroundColor: AppColors.cE0DEDE,
        appBar: AppBar(
          title: Text(S.of(context).call_master_app_bar_title),
          centerTitle: true,
          surfaceTintColor: AppColors.cE0DEDE,
          backgroundColor: AppColors.cE0DEDE,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
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
    return BlocBuilder<MasterBloc, MasterState>(builder: (context, state) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _ImageWidget(),
              Gap(20),
              _DropDownList(),
              Gap(20),
              AutoWrapTextField(),
              Gap(30),
              _TakePhotoButtons(),
              Gap(20),
              _CallMasterButton(),
            ],
          ),
        ),
      );
    });
  }
}

class _CallMasterButton extends StatelessWidget {
  const _CallMasterButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.c05A84F,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Text(
        S.of(context).call_master_title_button,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class _DropDownList extends StatelessWidget {
  const _DropDownList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const _DropDownCategory(),
    );
  }
}

class _TakePhotoButtons extends StatelessWidget {
  const _TakePhotoButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _PhotoButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(source: ImageSource.camera);
            if (pickedFile != null && context.mounted) {
              context.read<MasterBloc>().add(AttachImage(File(pickedFile.path)));
            }
          },
          text: S.of(context).call_master_take_photo,
        ),
        _PhotoButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
            if (pickedFile != null && context.mounted) {
              context.read<MasterBloc>().add(
                    AttachImage(
                      File(pickedFile.path),
                    ),
                  );
            }
          },
          text: S.of(context).call_master_attach_photo,
        ),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(builder: (context, state) {
      if (state.image != null) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                child: InteractiveViewer(
                  maxScale: 3.0,
                  child: Image.file(state.image!),
                ),
              ),
            );
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.file(state.image!),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}

class _DropDownCategory extends StatelessWidget {
  const _DropDownCategory();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterBloc, MasterState>(
      builder: (context, state) {
        return DropdownButton<ReportCategory>(
          value: state.selectedCategory,
          hint: Text(S.of(context).call_master_choose_category),
          isExpanded: true,
          onChanged: (category) {
            if (category != null) {
              context.read<MasterBloc>().add(SelectCategory(category));
            }
          },
          dropdownColor: Colors.white,
          items: ReportCategory.values.map(
            (ReportCategory category) {
              return DropdownMenuItem<ReportCategory>(
                value: category,
                child: Text(
                  category.toString().split('.').last,
                ),
              );
            },
          ).toList(),
        );
      },
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
        maxHeight: MediaQuery.of(context).size.height * 0.1,
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

class _PhotoButton extends StatelessWidget {
  const _PhotoButton({
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.c224795,
          fontSize: 16,
        ),
      ),
    );
  }
}
