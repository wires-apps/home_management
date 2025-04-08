import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key, required this.complaintScreenType});

  final ComplaintScreenType complaintScreenType;

  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      ///TODO добавить разрешение, на доступ к фото
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cE0DEDE,
      appBar: AppBar(
        backgroundColor: AppColors.cE0DEDE,
        title: const Text('Предложения'),
        centerTitle: true,
        leading: const BackButtonAppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _pickImage(ImageSource.gallery),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.c224795),
                  ),
                  alignment: Alignment.center,
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover, height: 200, width: double.infinity)
                      : Icon(
                          Icons.photo_camera,
                          size: 60,
                          color: Colors.grey.shade300,
                        ),
                ),
              ),
              Gap(MediaQuery.of(context).size.height * 0.02),
              const AutoWrapTextField(),
              Gap(MediaQuery.of(context).size.height * 0.1),
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
              const Gap(0),
            ],
          ),
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
