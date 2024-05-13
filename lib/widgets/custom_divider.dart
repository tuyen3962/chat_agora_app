import 'package:flutter/material.dart';
import 'package:mobileapp/common/component/component.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Component.color.grey300,
      thickness: 1,
      height: 1,
    );
  }
}
