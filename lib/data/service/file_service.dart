import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FileService extends GetxService {
  final ImagePicker picker = ImagePicker();

  Future<String?> onPickImage() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      return image?.path;
    } catch (err) {
      return null;
    }
  }

  Future<String?> onCapture() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      return image?.path;
    } catch (err) {
      return null;
    }
  }

  Future<String?> onPickVideo() async {
    try {
      final XFile? image = await picker.pickVideo(source: ImageSource.gallery);
      return image?.path;
    } catch (err) {
      return null;
    }
  }

  Future<String?> onRecord() async {
    try {
      final XFile? image = await picker.pickVideo(source: ImageSource.camera);
      return image?.path;
    } catch (err) {
      return null;
    }
  }
}
