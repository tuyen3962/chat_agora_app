import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:mobileapp/data/repositories/ibase_repository.dart';

abstract class IChatRepository extends IBaseRepository {
  Future<ChatRoom?> createRoom(List<String> members);
  Future<List<ChatRoom>> getListChatRoom({int page = 1, int limit = 30});
}
