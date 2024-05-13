import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/component/component.dart';
import 'package:mobileapp/common/theme/styles.dart';
import 'package:mobileapp/modules/dashboard/dashboard_controller.dart';
import 'package:mobileapp/utils/gap.dart';
import 'package:mobileapp/widgets/category_item.dart';
import 'package:mobileapp/widgets/primary_button.dart';
import 'package:mobileapp/widgets/text_field_custom.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class DashboardPage extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
      child: ListView(
        padding: padding(all: 16),
        children: [
          Text(
            "H1",
            style: Component.textStyle.h1,
          ),
          Text(
            "H3",
            style: Component.textStyle.h3,
          ),
          Text(
            "H4",
            style: Component.textStyle.h4,
          ),
          Text(
            "H5",
            style: Component.textStyle.h5,
          ),
          Text(
            "Large bold".tr,
            style: Component.textStyle.largeBold,
          ),
          Text(
            "Normal".tr,
          ),
          Text(
            "Medium Regular".tr,
            style: Component.textStyle.mediumRegular,
          ),
          PrimaryButton(title: "KPI".tr, onPressed: controller.onNavigateToKPI),
          PrimaryButton(title: "Chọn hình".tr, onPressed: controller.onPickImages),
          PrimaryButton(title: "Chụp hình".tr, onPressed: controller.onSystemCapture),
          PrimaryButton(title: "Hiện dialog".tr, onPressed: controller.onShowDialog),
          PrimaryButton(title: "is active = true".tr, onPressed: () {}),
          PrimaryButton(title: "is outline = true".tr, isOutline: true, onPressed: () {}),
          PrimaryButton(title: "is active = false".tr, isActive: false, onPressed: () {}),
          TextFieldCustom(
            labelText: "identification_number".tr,
            hintText: "identification_number".tr,
          ),
          CategoryItem(title: "change_language_to_vn".tr, onTap: () => controller.onChangeLanguage("vi")),
          CategoryItem(title: "change_language_to_en".tr, onTap: () => controller.onChangeLanguage("en")),
          CategoryItem(title: "change_theme".tr, onTap: controller.onChangeTheme)
        ].gapVertical(heightScale(16)),
      ),
    );
  }
}
