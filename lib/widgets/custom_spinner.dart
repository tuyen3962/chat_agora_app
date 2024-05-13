import 'package:flutter/material.dart';
import 'package:mobileapp/common/component/component.dart';

class CustomSpinner extends StatelessWidget {
  final double? height;
  const CustomSpinner({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: Component.color.primaryColor,
        ),
      ),
    );
  }
}
