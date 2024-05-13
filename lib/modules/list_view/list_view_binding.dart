import 'package:get/get.dart';
import 'package:mobileapp/modules/list_view/list_view_controller.dart';

class ListViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListViewController());
  }
}
