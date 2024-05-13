import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_config.dart';
import 'package:mobileapp/data/common/rest_api.dart';
import 'package:mobileapp/data/service/local_service.dart';

class BaseService extends GetxService {
  late RestAPI client;
  final dio = Dio();

  @override
  void onInit() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.add(LogInterceptor(responseHeader: false, responseBody: true, request: true, requestBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      LocalService localService = Get.find();
      final token = localService.token;

      if (token != null) {
        options.headers['Authorization'] = "Bearer " + token;
      }
      print(options.headers);
      handler.next(options);
    }));
    AppConfig conf = Get.find();
    client = RestAPI(
      dio,
      baseUrl: conf.baseURL,
    );
    super.onInit();
  }
}
