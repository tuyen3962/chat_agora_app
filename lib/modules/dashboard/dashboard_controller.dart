import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/translations/localization_service.dart';
import 'package:mobileapp/data/repositories/upload/iupload_repository.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:mobileapp/data/service/theme_service.dart';
import 'package:mobileapp/modules/grid_view/grid_view_params.dart';
import 'package:mobileapp/routes/app_pages.dart';
import 'package:mobileapp/utils/dialog.dart';
import 'package:mobileapp/utils/loading.dart';

class DashboardController extends GetxController {
  final ThemeService themeService;
  final FileService fileService;
  final IUploadRepository uploadRepository;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController channelEditingController = TextEditingController();

  DashboardController({
    required this.themeService,
    required this.fileService,
    required this.uploadRepository,
  });

  onShowDialog() {
    DialogUtils.showInfoDialog(title: "Gửi khảo sát thành công");
  }

  onChangeTheme() {
    themeService.changeThemeMode();
  }

  onChangeLanguage(String langCode) {
    LocalizationService.changeLocale(langCode);
  }

  onPickImages() async {
    String? path = await fileService.onPickImage();
    if (path == null) return;
    _uploadImage(path);
  }

  onSystemCapture() async {
    String? path = await fileService.onCapture();
    if (path == null) return;
    _uploadImage(path);
  }

  _uploadImage(String path) async {
    showLoading();
    await uploadRepository.uploadImage(path);
    dismissLoading();
  }

  onNavigateToKPI() async {
    Get.toNamed(
      Routes.KPI,
      arguments: GridViewParams(
        "https://picsum.photos/id/237/200/300",
      ),
      preventDuplicates: false,
    );
  }
}
