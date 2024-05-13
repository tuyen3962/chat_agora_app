import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:mobileapp/common/config/app_constants.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/base_response.dart';
import 'package:mobileapp/data/repositories/upload/iupload_repository.dart';
import 'package:path_provider/path_provider.dart';

Future<File> fixExifRotation(Map<String, String> map) async {
  String cachePath = map["cachePath"]!.toString();
  String imagePath = map["imagePath"]!.toString();
  String newImagePath = "${cachePath}/${imagePath.split("/").last}";
  final img.Image? capturedImage = img.decodeImage(await File(map["imagePath"]!).readAsBytes());

  final img.Image thumbnail = img.copyResize(capturedImage!, width: 1024);

  final img.Image orientedImage = img.bakeOrientation(thumbnail);

  return await File(newImagePath).writeAsBytes(img.encodeJpg(orientedImage));
}

class UploadRepository extends IUploadRepository {
  UploadRepository({
    required BaseService api,
  }) : _api = api;
  BaseService _api;

  @override
  Future<String> uploadImage(
    String path, {
    int sizeImage = SIZE_UPLOAD_HIGH_QUALITY_IMAGE,
  }) async {
    try {
      final fixedImageBytes = await FlutterImageCompress.compressWithFile(
        path,
        rotate: 0,
        quality: 75,
        keepExif: false,
        autoCorrectionAngle: true,
      );
      final tempDir = await getTemporaryDirectory();
      File fixedImage = await File('${tempDir.path}/image.png').create();
      fixedImage.writeAsBytesSync(fixedImageBytes!.toList());
      BaseResponse response = await _api.client.uploadImage(fixedImage, sizeImage: sizeImage);
      return response.results["object"]["url"];
    } catch (err) {
      throw handleError(err);
    }
  }
}
