import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/utils/octo.dart';
import 'package:octo_image/octo_image.dart';

class CustomAvatar extends StatelessWidget {
  final double size;
  final double? height;
  final double? width;
  final String? url;
  final String? path;
  final double? borderRadius;
  final BorderRadius? borderSideRadius;
  final String? hash;
  final Function()? onTap;

  const CustomAvatar({
    this.size = 50,
    this.height,
    this.width,
    this.url,
    this.path,
    this.borderRadius,
    this.borderSideRadius,
    this.onTap,
    this.hash,
    Key? key,
  }) : super(key: key);

  Widget _buildImageWidget(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _getImageHeight(),
        width: _getImageWidth(),
        decoration: BoxDecoration(
          borderRadius: borderSideRadius ?? BorderRadius.circular(borderRadius ?? _getImageWidth() / 2),
        ),
        child: ClipRRect(
          borderRadius: borderSideRadius ?? BorderRadius.circular(borderRadius ?? _getImageWidth() / 2),
          child: path != null ? _buildLocalImage() : _buildNetworkImage(context),
        ),
      ),
    );
  }

  Widget _buildLocalImage() {
    return Image.file(
      File(path!),
      fit: BoxFit.cover,
      height: _getImageHeight(),
      width: _getImageWidth(),
      gaplessPlayback: true,
    );
  }

  Widget _buildNetworkImage(BuildContext context) {
    return OctoImage(
      fit: BoxFit.cover,
      height: _getImageHeight(),
      width: _getImageWidth(),
      image: CachedNetworkImageProvider(url ?? ''),
      placeholderBuilder: OctoBlurUtils.placeHolder(hash),
      errorBuilder: OctoBlurUtils.error(hash),
    );
  }

  double _getImageHeight() {
    return height != null ? heightScale(height) : widthScale(size);
  }

  double _getImageWidth() {
    return widthScale(width ?? size);
  }

  @override
  Widget build(BuildContext context) {
    return _buildImageWidget(context);
  }
}
