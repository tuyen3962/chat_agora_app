import 'package:flutter/material.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/utils/image_paths.dart';
import 'package:mobileapp/widgets/svg_image_custom.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const CategoryItem({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Component.radius.radius12,
      onTap: onTap,
      child: Ink(
        height: heightScale(48),
        padding: padding(horizontal: 12),
        decoration: BoxDecoration(borderRadius: Component.radius.radius12, color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Component.textStyle.largeSemiBold.copyWith(color: Component.color.titleColor),
            ),
            SvgImageCustom(imagePath: ImagePaths.right_arrow, size: 24),
          ],
        ),
      ),
    );
  }
}
