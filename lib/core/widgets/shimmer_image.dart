import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const ShimmerImage({
    super.key,
    this.imageUrl, // imageUrl может быть null
    this.width = 100,
    this.height = 100,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          // Shimmer эффект как замещающий индикатор, пока изображение загружается
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: width,
              height: height,
              color: Colors.white,
            ),
          ),
          // Загружаем изображение
          Image.network(
            imageUrl ?? "",  // если imageUrl null, то передаем пустую строку
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child; // Показываем изображение, если оно загружено
              } else {
                return const SizedBox(); // Показать shimmer, пока изображение загружается
              }
            },
            errorBuilder: (context, error, stackTrace) {
              // Показываем иконку ошибки, если изображение не загрузилось
              return Icon(Icons.error, size: width / 2, color: Colors.red);
            },
          ),
        ],
      ),
    );
  }
}
