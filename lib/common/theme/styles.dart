import 'package:flutter/material.dart';
import 'package:mobileapp/utils/responsive/responsive_extension.dart';

double heightScale(double? height) => height?.height ?? 0;
double widthScale(double? width) => width?.width ?? 0;

EdgeInsets padding({
  double? top,
  double? bottom,
  double? left,
  double? right,
  double? horizontal,
  double? vertical,
  double? all,
}) =>
    EdgeInsets.only(
      top: (top ?? vertical ?? all ?? 0).height,
      bottom: (bottom ?? vertical ?? all ?? 0).height,
      left: (left ?? horizontal ?? all ?? 0).width,
      right: (right ?? horizontal ?? all ?? 0).width,
    );
EdgeInsets margin({
  double? top,
  double? bottom,
  double? left,
  double? right,
  double? horizontal,
  double? vertical,
  double? all,
}) =>
    EdgeInsets.only(
      top: (top ?? vertical ?? all ?? 0).height,
      bottom: (bottom ?? vertical ?? all ?? 0).height,
      left: (left ?? horizontal ?? all ?? 0).width,
      right: (right ?? horizontal ?? all ?? 0).width,
    );

extension ReponsiveSizeExtension on num {
  double get h => heightScale(this.toDouble());

  double get w => widthScale(this.toDouble());
}
