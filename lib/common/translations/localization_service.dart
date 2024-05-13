import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/translations/value/st_en_us.dart';
import 'package:mobileapp/common/translations/value/st_vi_kr.dart';
import 'package:mobileapp/data/service/local_service.dart';

const defaultLocale = Locale('vi', 'VN');

class LocalizationService extends Translations {
// locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
  static final locale = _getLocaleFromLanguage();

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static final fallbackLocale = defaultLocale;

// language code của những locale được support
  static final langCodes = [
    'en',
    'vi',
  ];

// các Locale được support
  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];
// function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
  static void changeLocale(String? langCode) {
    LocalService localService = Get.find();
    localService.cacheLanguage(langCode ?? defaultLocale.languageCode);
    updateLanguage(langCode);
  }

  static void updateLanguage(String? langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  static void loadLanguage() {
    LocalService localService = Get.find();
    updateLanguage(localService.language);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'vi_VN': viVN,
      };

  static Locale _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale ?? defaultLocale;
  }
}
