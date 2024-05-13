import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_constants.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/modules/list_view/list_view_controller.dart';
import 'package:mobileapp/widgets/loadmore/custom_loadmore.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class ListViewPage extends GetWidget<ListViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.stringList.value;
        var isLoading = list == null;
        return WrapPage(
          child: LoadMore(
            isLoading: isLoading,
            isFinish: controller.isOutOfData.value,
            onLoadMore: controller.onLoadMore,
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              padding: padding(vertical: 22, horizontal: 16),
              itemCount: list?.length ?? PLACEHOLDER_ITEM_LENGTH,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  list?[index] ?? LONG_TITLE_PLACEHOLDER,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
