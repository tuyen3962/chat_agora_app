import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:path_provider_ios/path_provider_ios.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Platform.isAndroid) PathProviderAndroid.registerWith();
  if (Platform.isIOS) PathProviderIOS.registerWith();

  //handle receive notification on background

  return null;
}
