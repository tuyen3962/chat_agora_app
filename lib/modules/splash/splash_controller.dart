import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/translations/localization_service.dart';
import 'package:mobileapp/data/service/theme_service.dart';
import 'package:mobileapp/routes/app_pages.dart';

class SplashController extends GetxController {
  final ThemeService themeService;
  SplashController({required this.themeService});
  goToMainPage() {
    FlutterNativeSplash.remove();
    // get theme from local
    loadTheme();
    loadLanguage();

    Get.offAllNamed(Routes.MAIN_PAGE);
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
