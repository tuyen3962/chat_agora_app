import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_constants.dart';

class ChatAgoraService extends GetxService {
  ChatAgoraService();

  @override
  void onInit() {
    super.onInit();
    _initSDK();
  }

  void _initSDK() async {
    ChatOptions options = ChatOptions(
      appKey: AgoraChatConfig.appKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();
  }

  Future<void> initServiceWithAccount(String userId, String token) async {
    await ChatClient.getInstance.loginWithAgoraToken(userId, token);
  }

  Future<void> onCreateAccount(String userId, String password) async {
    ChatClient.getInstance.createAccount(userId, password);
  }

  Future<void> onCreateRoom() async {
    ChatClient.getInstance.chatRoomManager.createChatRoom('');
  }
}
