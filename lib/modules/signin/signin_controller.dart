import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_constants.dart';
import 'package:mobileapp/data/repositories/auth/iauth_repository.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/chat_agora_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class SignInController extends GetxController {
  final IAuthRepository authRepository;
  final AccountService accountService;
  final ChatAgoraService chatAgoraService;

  SignInController({
    required this.authRepository,
    required this.accountService,
    required this.chatAgoraService,
  });

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final isObscure = true.obs;

  void onChangeObscure() {
    isObscure.value = !isObscure.value;
  }

  void signIn() async {
    try {
      if (GetUtils.isEmail(emailCtrl.text)) {
        final response = await authRepository.loginWithEmailFirebase(emailCtrl.text, passCtrl.text);
        if (response == null) {
          final registerRes = await authRepository.registerEmailPassword(emailCtrl.text, passCtrl.text);
          await chatAgoraService.onCreateAccount(registerRes.account.id, passCtrl.text);
          await chatAgoraService.initServiceWithAccount(registerRes.account.id, AgoraChatConfig.agoraToken);
          accountService.setAccount(registerRes.account);
          Get.toNamed(Routes.HOME);
        } else {
          await chatAgoraService.initServiceWithAccount(response.account.id, AgoraChatConfig.agoraToken);
          accountService.setAccount(response.account);
          Get.toNamed(Routes.HOME);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
