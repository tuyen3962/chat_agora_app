import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/utils/image_paths.dart';
import 'package:mobileapp/widgets/svg_image_custom.dart';

class DialogUtils {
  static showInfoDialog({
    String title = "",
    Widget? content,
  }) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Container(
            width: Get.width - widthScale(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: padding(top: 15, right: 13),
                      child: Container(
                        padding: padding(vertical: 24, horizontal: 24),
                        decoration: BoxDecoration(
                            borderRadius: Component.radius.radius8, color: Theme.of(context).dialogBackgroundColor),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: Component.textStyle.h4,
                            ),
                            if (content != null)
                              Padding(
                                padding: padding(top: 8),
                                child: content,
                              ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          width: widthScale(40),
                          height: widthScale(40),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dialogBackgroundColor,
                            borderRadius: Component.radius.radius52,
                            boxShadow: Component.shadow.widgetShadow,
                          ),
                          child: Center(
                            child: SvgImageCustom(
                              imagePath: ImagePaths.close,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
