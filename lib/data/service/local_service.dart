import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobileapp/common/config/app_storage_key.dart';

class LocalService extends GetxService {
  GetStorage? _appStorage;

  GetStorage get appStorage {
    if (_appStorage == null) {
      _appStorage = GetStorage();
    }
    return _appStorage!;
  }

  Future write(String key, String value) {
    return appStorage.write(key, value);
  }

  String? get language => appStorage.read(StorageKey.LANGUAGE);

  String? get token => appStorage.read(StorageKey.TOKEN);

  Future cacheLanguage(String language) {
    return write(StorageKey.LANGUAGE, language);
  }

  clear() async => appStorage.erase();
}
