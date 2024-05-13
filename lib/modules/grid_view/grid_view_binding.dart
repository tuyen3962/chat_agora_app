import 'package:get/get.dart';
import 'package:mobileapp/modules/grid_view/grid_view_controller.dart';

class GridViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.create(() => GridViewController());
  }
}
