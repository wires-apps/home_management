import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String drawable;
  final Color? color;
  final double? width;
  final double? height;
  final ColorFilter? colorFilter;

  const SvgAsset({
    required this.drawable,
    super.key,
    this.color,
    this.width,
    this.height,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        drawable,
        width: width ?? 24,
        height: height ?? 24,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
