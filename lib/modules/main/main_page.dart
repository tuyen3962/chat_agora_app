import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/modules/dashboard/dashboard_page.dart';
import 'package:mobileapp/modules/grid_view/grid_view_page.dart';
import 'package:mobileapp/modules/list_view/list_view_page.dart';
import 'package:mobileapp/modules/main/main_controller.dart';
import 'package:mobileapp/utils/image_paths.dart';
import 'package:mobileapp/widgets/svg_image_custom.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

abstract class BottomTabType {
  static const HOME = 'HOME';
  static const NEWS = 'NEWS';
  static const CREATE = 'CREATE';
  static const CHAT = 'CHAT';
  static const PROFILE = 'PROFILE';
}

class BottomBarModel {
  String label;
  String icon;
  Widget page;

  BottomBarModel({
    required this.label,
    required this.icon,
    required this.page,
  });
}

class MainPage extends GetWidget<MainController> {
  Widget renderBottomTab(BottomBarModel bottomBarModel, {int index = 0}) {
    return Obx(
      () => Expanded(
        child: InkWell(
          onTap: () => controller.onItemTapped(index),
          child: Ink(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgImageCustom(
                  imagePath: bottomBarModel.icon,
                  size: 24,
                  color: index == controller.selectedIndex.value
                      ? Theme.of(Get.context!).primaryColor
                      : Component.color.grey500,
                ),
                SizedBox(height: heightScale(2)),
                Text(
                  bottomBarModel.label,
                  style: Component.textStyle.smallBold.copyWith(
                    color: index == controller.selectedIndex.value
                        ? Theme.of(Get.context!).primaryColor
                        : Component.color.grey500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem renderBottomBar(BottomBarModel bottomBarModel, {int index = 0}) {
    return BottomNavigationBarItem(
      activeIcon: renderBottomTab(bottomBarModel, index: index),
      icon: renderBottomTab(bottomBarModel, index: index),
      label: bottomBarModel.label,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<BottomBarModel> listBottomBar = [
      BottomBarModel(
        label: "dashboard".tr,
        icon: ImagePaths.dashboard,
        page: DashboardPage(),
      ),
      BottomBarModel(
        label: "kpi".tr,
        icon: ImagePaths.kpi,
        page: GridViewPage(),
      ),
      BottomBarModel(
        label: "shop_list".tr,
        icon: ImagePaths.bullet_list,
        page: ListViewPage(),
      ),
      BottomBarModel(
        label: "quick_access".tr,
        icon: ImagePaths.quick_access,
        page: Container(),
      ),
    ];
    return WrapPage(
      child: WillPopScope(
        onWillPop: controller.onWillPop,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChange,
          children: listBottomBar.map((e) => e.page).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        height: heightScale(72),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: Component.shadow.widgetShadow,
        ),
        child: Row(
          children: listBottomBar
              .asMap()
              .map((index, value) => MapEntry(index, renderBottomTab(value, index: index)))
              .values
              .toList(),
        ),
      ),
    );
  }
}
