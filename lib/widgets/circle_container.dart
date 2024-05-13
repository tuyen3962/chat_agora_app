import 'package:flutter/material.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';

class CircleContainer extends StatelessWidget {
  final double size;
  final Color? color;
  final Widget? child;
  const CircleContainer({
    Key? key,
    required this.size,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthScale(size),
      height: widthScale(size),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: Component.radius.custom(
          widthScale(size / 2),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
