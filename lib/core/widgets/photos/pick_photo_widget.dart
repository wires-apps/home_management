import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';

class PickPhotoWidget extends StatelessWidget {
  const PickPhotoWidget({
    super.key,
    this.image,
    required this.onTap,
  });

  final File? image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.c224795),
        ),
        alignment: Alignment.center,
        child: image != null
            ? InteractiveViewer(
                panEnabled: true,
                minScale: 0.5,
                maxScale: 3.0,
                child: Image.file(
                  image!,
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
    );
  }
}
