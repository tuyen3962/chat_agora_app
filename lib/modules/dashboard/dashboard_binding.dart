import 'package:get/get.dart';
import 'package:mobileapp/modules/dashboard/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(
        themeService: Get.find(),
        fileService: Get.find(),
        uploadRepository: Get.find(),
      ),
    );
  }
}
