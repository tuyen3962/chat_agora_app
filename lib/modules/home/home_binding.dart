import 'package:get/get.dart';
import 'package:mobileapp/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(
      chatRepository: Get.find(),
    ));
  }
}
