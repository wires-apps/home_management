import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/common/models/complaint_screen_type.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/widgets/complaint/custom_app_bar.dart';
import 'package:home_management/core/widgets/error_dialog.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/bloc/complaint_details_bloc.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';

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
        backgroundColor: AppColors.cE0DEDE,
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
        maxHeight: MediaQuery.of(context).size.height * 0.5, // Ограничение по высоте
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.c224795),
        ),
        child: SingleChildScrollView(
          child: AutoSizeText(
            message ?? '',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class PhotoCarousel extends StatelessWidget {
  final List<PhotoModelResponseDto>? photoUrls;

  const PhotoCarousel({super.key, required this.photoUrls});

  @override
  Widget build(BuildContext context) {
    if (photoUrls == null) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade500,
        ),
        child: const Center(
          child: Text(
            'Нет фото',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      );
    }
    List<String> photoPaths = photoUrls!.map((photo) => photo.path).toList();
    if (photoPaths.length == 1) {
      return SizedBox(
        height: 300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'http://212.112.105.242:8800/storage/${photoPaths[0]}',
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const FailureImage();
            },
          ),
        ),
      );
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
      items: photoPaths.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'http://212.112.105.242:8800/storage/$url',
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
            },
          ),
        );
      }).toList(),
    );
  }
}
