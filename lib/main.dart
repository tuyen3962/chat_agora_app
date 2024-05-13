import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobileapp/common/theme/app_theme.dart';
import 'package:mobileapp/common/translations/localization_service.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/repositories/account/account_repository.dart';
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';
import 'package:mobileapp/data/repositories/auth/auth_repository.dart';
import 'package:mobileapp/data/repositories/auth/iauth_repository.dart';
import 'package:mobileapp/data/repositories/upload/iupload_repository.dart';
import 'package:mobileapp/data/repositories/upload/upload_repository.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:mobileapp/data/service/local_service.dart';
import 'package:mobileapp/data/service/notification_service/notification_service.dart';
import 'package:mobileapp/data/service/theme_service.dart';
import 'package:mobileapp/routes/app_pages.dart';
import 'package:mobileapp/utils/responsive/size_config.dart';
import 'package:mobileapp/utils/scroll_behavior.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();

  Get.lazyPut(() => BaseService());

  Get.put<FileService>(FileService(), permanent: true);

  Get.put<LocalService>(LocalService(), permanent: true);

  Get.put<ThemeService>(ThemeService(), permanent: true);

  Get.put<IUploadRepository>(UploadRepository(api: Get.find()), permanent: true);
  Get.put<IAccountRepository>(AccountRepository(api: Get.find()), permanent: true);
  Get.put<IAuthRepository>(AuthRepository(api: Get.find()), permanent: true);

  Get.put<AccountService>(
      AccountService(
        localService: Get.find(),
        accountRepository: Get.find(),
        authRepository: Get.find(),
      ),
      permanent: true);

  Get.put<NotificationService>(
    NotificationService(accountRepository: Get.find(), accountService: Get.find()),
    permanent: true,
  );

  var getMaterialApp = GetMaterialApp(
    themeMode: ThemeService().getThemeMode(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
    ],
    localizationsDelegates: [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ],
    locale: LocalizationService.locale,
    fallbackLocale: LocalizationService.fallbackLocale,
    translations: LocalizationService(),
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale?.languageCode &&
            supportedLocale.countryCode == locale?.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    debugShowCheckedModeBanner: false,
    theme: lightThemeData,
    darkTheme: darkThemeData,
    getPages: AppPages.pages,
    initialRoute: Routes.SPLASH,
    initialBinding: BindingsBuilder(() {}),
    builder: EasyLoading.init(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: ScrollConfiguration(
          behavior: DisableGlowBehavior(),
          child: child!,
        ),
      ),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig(
              designScreenWidth: 375,
              designScreenHeight: 812,
            ).init(constraints, orientation);

            return getMaterialApp;
          },
        );
      },
    ));
  });
}
