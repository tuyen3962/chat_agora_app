import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/data/models/feed.dart';
import 'package:mobileapp/modules/grid_view/grid_view_params.dart';
import 'package:mobileapp/routes/app_pages.dart';
import 'package:mobileapp/widgets/custom_avatar.dart';

class GridViewItem extends StatelessWidget {
  final Feed? item;
  const GridViewItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  _onPress() {
    if (item == null || !item!.isHavingImage) return;
    var randomId = Random().nextInt(50) + 100;
    Get.toNamed(
      Routes.KPI,
      arguments: GridViewParams("https://picsum.photos/id/$randomId/200/300"),
      preventDuplicates: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("item type: ${item?.type}");
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomAvatar(
          url: item?.image,
          hash: item?.hash,
          onTap: _onPress,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item?.title ?? '',
              style: Component.textStyle.mediumSemiBold.copyWith(color: Colors.white),
            ),
            Text(
              item?.description ?? '',
              style: Component.textStyle.mediumRegular.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
