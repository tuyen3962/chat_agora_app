import 'package:get/get.dart';
import 'package:mobileapp/modules/signin/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController(
      authRepository: Get.find(),
      accountService: Get.find(),
      chatAgoraService: Get.find(),
    ));
  }
}
