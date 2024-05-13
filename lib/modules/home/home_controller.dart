import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/repositories/chat/ichat_repository.dart';
import 'package:mobileapp/routes/app_pages.dart';

class HomeController extends GetxController {
  final IChatRepository chatRepository;

  HomeController({required this.chatRepository});

  final chatRooms = Rx<List<ChatRoom>?>(null);
  int page = 1;

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  Future<void> onRefresh() async {
    chatRooms.value = null;
    page = 1;
    final result = await chatRepository.getListChatRoom(page: page);
    chatRooms.value = result;
  }

  Future<void> onCreateRoom() async {
    final res = await Get.toNamed(Routes.ADD_CHAT);
    if (res != null && res is ChatRoom) {
      chatRooms.value?.add(res);
    }
  }
}
