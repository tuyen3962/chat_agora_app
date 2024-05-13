import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoResultWidget extends StatelessWidget {
  final String? text;
  final double? height;
  const NoResultWidget({Key? key, this.text, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          ListView(),
          Center(
            child: Text(
              text ?? "No data".tr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
