import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:mobileapp/data/repositories/chat/ichat_repository.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:uuid/uuid.dart';

class ChatRepository extends IChatRepository {
  final AccountService accountService;

  ChatRepository({required this.accountService});

  ChatClient get client => ChatClient.getInstance;

  @override
  Future<ChatRoom?> createRoom(List<String> members) async {
    try {
      final room = await client.chatRoomManager.createChatRoom(
        Uuid().v4(),
        members: [...members, accountService.myAccount?.id ?? ''],
      );
      return room;
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<List<ChatRoom>> getListChatRoom({int page = 1, int limit = 30}) async {
    try {
      final rooms = await client.chatRoomManager.fetchPublicChatRoomsFromServer(pageNum: page, pageSize: limit);
      return rooms.data ?? <ChatRoom>[];
    } catch (e) {
      print(e);
    }

    return [];
  }
}
