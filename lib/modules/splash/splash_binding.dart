import 'package:get/get.dart';
import 'package:mobileapp/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        themeService: Get.find(),
        authRepository: Get.find(),
        chatAgoraService: Get.find(),
        accountService: Get.find(),
      ),
    );
  }
}
