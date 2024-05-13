import 'package:get/get.dart';
import 'package:mobileapp/modules/dashboard/dashboard_controller.dart';
import 'package:mobileapp/modules/grid_view/grid_view_controller.dart';
import 'package:mobileapp/modules/list_view/list_view_controller.dart';
import 'package:mobileapp/modules/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.create(
      () => DashboardController(
        themeService: Get.find(),
        fileService: Get.find(),
        uploadRepository: Get.find(),
      ),
    );
    Get.create(() => GridViewController());

    Get.create(
      () => ListViewController(),
    );
    Get.create(
      () => MainController(
        accountService: Get.find(),
        notificationService: Get.find(),
      ),
    );
  }
}
