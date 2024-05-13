import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/translations/localization_service.dart';
import 'package:mobileapp/data/repositories/auth/iauth_repository.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/chat_agora_service.dart';
import 'package:mobileapp/data/service/theme_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class SplashController extends GetxController {
  final ThemeService themeService;
  final IAuthRepository authRepository;
  final AccountService accountService;
  final ChatAgoraService chatAgoraService;
  SplashController({
    required this.themeService,
    required this.authRepository,
    required this.accountService,
    required this.chatAgoraService,
  });
  goToMainPage() async {
    FlutterNativeSplash.remove();
    // get theme from local
    loadTheme();
    loadLanguage();
    final account = await authRepository.getAccount();
    if (account != null) {
      accountService.setAccount(account);
      // await chatAgoraService.initServiceWithAccount(account.id, AgoraChatConfig.agoraToken);
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SIGN_IN);
    }
  }

  loadTheme() {
    themeService.loadTheme();
  }

  loadLanguage() {
    LocalizationService.loadLanguage();
  }

  @override
  void onInit() async {
    super.onInit();
    //await loadData();
    Future.delayed(Duration(seconds: 2), goToMainPage);
  }
}
