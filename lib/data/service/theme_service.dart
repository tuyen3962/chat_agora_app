import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobileapp/common/config/app_storage_key.dart';

class ThemeService extends GetxService {
  GetStorage? _appStorage;

  GetStorage get appStorage {
    if (_appStorage == null) {
      _appStorage = GetStorage();
    }
    return _appStorage!;
  }

  var _isDarkMode = false.obs;

  ThemeMode getThemeMode() {
    return _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return appStorage.read(StorageKey.THEME_MODE) ?? false;
  }

  saveThemMode(bool isDarkMode) {
    appStorage.write(StorageKey.THEME_MODE, isDarkMode);
  }

  loadTheme() async {
    if (isSavedDarkMode()) {
      _isDarkMode.value = true;
      Get.changeThemeMode(ThemeMode.dark);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }

  changeThemeMode() {
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    SystemChrome.setSystemUIOverlayStyle(_isDarkMode.value ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);

    _isDarkMode.toggle();
    //save to storage
    saveThemMode(!isSavedDarkMode());
  }
}
