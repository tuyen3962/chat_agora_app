import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/common/theme/styles.dart';

class SvgImageCustom extends StatelessWidget {
  final String imagePath;
  final double size;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  const SvgImageCustom({
    Key? key,
    required this.imagePath,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath.contains('png')) {
      return Image.asset(
        imagePath,
        width: widthScale(width ?? size),
        height: height != null ? heightScale(height) : widthScale(size),
        fit: fit ?? BoxFit.contain,
      );
    }
    return SvgPicture.asset(
      imagePath,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: widthScale(width ?? size),
      height: height != null ? heightScale(height) : widthScale(size),
      fit: fit ?? BoxFit.contain,
    );
  }
}
