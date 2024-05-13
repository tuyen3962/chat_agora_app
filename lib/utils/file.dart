import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;

class FileUtils {
  static String md5String(String string) {
    return md5.convert(utf8.encode(string)).toString();
  }

  static Future<File> flipImage(XFile xfile) async {
    Uint8List imageBytes = await xfile.readAsBytes();

    img.Image? originalImage = img.decodeImage(imageBytes);
    img.Image fixedImage = img.flipHorizontal(originalImage!);

    File file = File(xfile.path);
    File fixedFile = await file.writeAsBytes(
      img.encodeJpg(fixedImage),
      flush: true,
    );
    return fixedFile;
  }

  static Future<File> compressImageFromFile(File file, String targetPath, {int? rotate}) async {
    // check orientation of image

    List<int> imageBytes = await file.readAsBytes();

    final originalImage = img.decodeImage(imageBytes);

    final height = originalImage?.height;
    final width = originalImage?.width;

    if (height == null || width == null) return file;

    // var isPortrait = height > width;
    var newFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 90,
      rotate: rotate ?? 0,
    );

    if (newFile == null) return file;
    return File(newFile.path);
  }
}
