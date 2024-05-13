import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';
import 'package:mobileapp/data/repositories/chat/ichat_repository.dart';
import 'package:mobileapp/data/service/account_service.dart';

class AddChatController extends GetxController {
  final IAccountRepository accountRepository;
  final IChatRepository chatRepository;
  final AccountService accountService;

  AddChatController({
    required this.accountRepository,
    required this.chatRepository,
    required this.accountService,
  });

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  @override
  void onClose() {
    notifier.dispose();
    super.onClose();
  }

  final otherUser = Rx<List<Account>?>(null);
  final selectedUser = <String>[];
  final notifier = ValueNotifier(0);

  Future<void> onRefresh() async {
    otherUser.value = null;
    otherUser.value = await accountRepository.getListAccounts(accountService.myAccount?.id ?? '');
  }

  void onUpdateUserSelected(String userId) {
    if (selectedUser.contains(userId)) {
      selectedUser.remove(userId);
    } else {
      selectedUser.add(userId);
    }
    notifier.value += 1;
  }

  void onCreate() async {
    if (selectedUser.isEmpty) return;
    final data = await chatRepository.createRoom(selectedUser);
    if (data != null) {
      Get.back(result: data);
    }
  }
}
