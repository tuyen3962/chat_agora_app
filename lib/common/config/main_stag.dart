import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_config.dart';
import 'package:mobileapp/main.dart' as common;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  AppConfig _config = AppConfig(env: Environment.STAGING, config: {
    FLAVOR: "QC",
    BASE_URL: FlutterConfig.get('BASE_URL'),
  });
  Get.put<AppConfig>(_config, permanent: true);
  common.main();
}
