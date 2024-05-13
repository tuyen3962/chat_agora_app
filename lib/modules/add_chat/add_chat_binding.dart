import 'package:get/get.dart';
import 'package:mobileapp/modules/add_chat/add_chat_controller.dart';

class AddChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddChatController(
      accountRepository: Get.find(),
      accountService: Get.find(),
      chatRepository: Get.find(),
    ));
  }
}
