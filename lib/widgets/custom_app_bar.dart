import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';

class CustomAppBar extends StatefulWidget {
  final Function? onBack;
  final String? title;
  final List<Widget>? actions;
  final bool? showBack;
  final double? height;
  const CustomAppBar({
    Key? key,
    this.onBack,
    this.title,
    this.actions,
    this.showBack = true,
    this.height,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  double? get height => widget.height;
  bool? get showBack => widget.showBack;
  String get title => widget.title ?? '';
  List<Widget> get actions => widget.actions ?? [];

  back() {
    if (widget.onBack != null) {
      widget.onBack!();
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScale(height ?? 48),
      padding: padding(horizontal: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showBack == true)
                BackButton(
                  onPressed: back,
                ),
              Row(
                children: actions.map((e) => e).toList(),
              ),
            ],
          ),
          Text(
            title,
            style: Component.textStyle.largeBold,
          ),
        ],
      ),
    );
  }
}
