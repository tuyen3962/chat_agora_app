import 'package:get/get.dart';
import 'package:mobileapp/modules/temp/_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}
