import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:home_management/core/bloc/widgets/snackbar_listener.dart';
import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/core/res/app_colors.dart';
import 'package:home_management/core/ui/app_text_style.dart';
import 'package:home_management/core/widgets/buttons/back_button.dart';
import 'package:home_management/core/widgets/error_dialog.dart';
import 'package:home_management/core/widgets/loader.dart';
import 'package:home_management/features/notification/bloc/notification_bloc.dart';
import 'package:home_management/features/notification/models/photo_model_response_dto.dart';
import 'package:home_management/features/notification/presentation/desktop_ui/desktop_notification_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => MobileNotificationPage(id: id),
      tablet: (context) => MobileNotificationPage(id: id),
      desktop: (context) => const DesktopNotificationPage(),
    );
  }
}

class MobileNotificationPage extends StatelessWidget {
  const MobileNotificationPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationBloc>()..add(NotificationDownload(id: id)),
      child: BlocSnackBarListenerWithChild<NotificationBloc>(
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.cEDEDEC,
              appBar: AppBar(
                leading: const BackButtonAppBarWidget(),
                backgroundColor: AppColors.cEDEDEC,
                title: Text(
                  state.item?.title ?? 'Уведомление',
                  style: AppTextStyle.style,
                ),
                centerTitle: true,
                actions: [
                  state.item?.hasPdf == true ? _PdfButton(state.item?.pdfUrl ?? '') : SizedBox(),
                  Gap(20),
                ],
                // elevation: 0,
              ),
              body: const Body(),
            );
          },
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Loader();
        }
        return Container(
          height: MediaQuery.of(context).size.height * 04,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Gap(10),
              PhotoCarousel(photoUrls: state.item?.photos),
              const SizedBox(height: 20),
              AutoWrapTextField(message: state.item?.message),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

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
          ),
        );
      }).toList(),
    );
  }
}

class _PdfButton extends StatelessWidget {
  const _PdfButton(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<NotificationBloc>().add(NotificationOpenPdfUrl(url: url));
      },
      icon: const Icon(
        Icons.picture_as_pdf,
        size: 35,
        color: AppColors.cA5BE76,
      ),
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
        child: SingleChildScrollView(
          child: AutoSizeText(
            message ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyle.style.copyWith(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
