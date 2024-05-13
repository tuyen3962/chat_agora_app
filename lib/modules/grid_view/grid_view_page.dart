import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_constants.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/data/models/feed.dart';
import 'package:mobileapp/modules/grid_view/grid_view_controller.dart';
import 'package:mobileapp/widgets/grid_view_item.dart';
import 'package:mobileapp/widgets/loadmore/custom_loadmore.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class GridViewPage extends GetWidget<GridViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.feedList.value;
        var isLoading = list == null;
        return WrapPage(
          child: LoadMore(
            isLoading: isLoading,
            isFinish: controller.isOutOfData.value,
            onLoadMore: controller.onLoadMore,
            onRefresh: controller.onRefresh,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: widthScale(16),
                  crossAxisSpacing: widthScale(16),
                  childAspectRatio: 1,
                ),
                padding: padding(vertical: 22, horizontal: 16),
                itemCount: list?.length ?? PLACEHOLDER_ITEM_LENGTH,
                itemBuilder: (context, index) {
                  var item = list?[index] ?? Feed.fakeFeed;
                  return GridViewItem(key: Key(item.id ?? ''), item: item);
                }),
          ),
        );
      },
    );
  }
}
