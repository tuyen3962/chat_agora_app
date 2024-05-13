import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/config/app_error.dart';
import 'package:mobileapp/utils/dialog.dart';
import 'package:mobileapp/utils/loading.dart';

abstract class IBaseRepository {
  handleError(dynamic error) {
    dismissLoading();
    switch (error.runtimeType) {
      case DioError:
        var dioError = error as DioError;
        switch (dioError.response?.statusCode) {
          case ErrorCode.deviceExpired:
            // handle here
            break;
          default:
            DialogUtils.showInfoDialog(
              title: "error_message_unknown".tr,
            );
            print("Unknown Error: ${error.toString()}");
            break;
        }
        break;

      default:
        DialogUtils.showInfoDialog(
          title: "error_message_unknown".tr,
        );
        print("Unknown Error: ${error.toString()}");
        // throw FormatException("Error: ", error);
        break;
    }
  }
}
