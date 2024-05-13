import 'package:get/get.dart';
import 'package:mobileapp/modules/add_chat/add_chat_binding.dart';
import 'package:mobileapp/modules/add_chat/add_chat_page.dart';
import 'package:mobileapp/modules/grid_view/grid_view_binding.dart';
import 'package:mobileapp/modules/grid_view/grid_view_page.dart';
import 'package:mobileapp/modules/home/home_binding.dart';
import 'package:mobileapp/modules/home/home_page.dart';
import 'package:mobileapp/modules/main/main_binding.dart';
import 'package:mobileapp/modules/main/main_page.dart';
import 'package:mobileapp/modules/signin/signin_binding.dart';
import 'package:mobileapp/modules/signin/signin_page.dart';
import 'package:mobileapp/modules/splash/splash_binding.dart';
import 'package:mobileapp/modules/splash/splash_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.KPI,
      page: () => GridViewPage(),
      binding: GridViewBinding(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADD_CHAT,
      page: () => AddChatPage(),
      binding: AddChatBinding(),
    ),
  ];
}
