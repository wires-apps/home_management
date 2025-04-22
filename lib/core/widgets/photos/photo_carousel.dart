import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';

class PhotoCarousel extends StatelessWidget {
  final List<PhotoModelResponseDto>? photoUrls;

  const PhotoCarousel({super.key, required this.photoUrls});

  @override
  Widget build(BuildContext context) {
    if (photoUrls == null || photoUrls!.isEmpty) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade500,
          border: Border.all(color: AppColors.c0084EF, width: 1.6),
        ),
        child: const Center(
          child: Text(
            'Нет фото',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    }
    List<String> photoPaths = photoUrls!.map((photo) => photo.path).toList();
    if (photoPaths.length == 1) {
      return PhotoWidget(url: photoPaths[0]);
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
        return PhotoWidget(url: url);
      }).toList(),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.c0084EF,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'http://212.112.105.242:8800/storage/$url',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/placeholder.png',
              fit: BoxFit.cover,
            );
          },
          loadingBuilder: (context, widget, event) {
            if (event?.cumulativeBytesLoaded == event?.expectedTotalBytes) {
              return widget;
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return child;
          },
        ),
      ),
    );
  }
}
