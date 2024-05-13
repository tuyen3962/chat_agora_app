import 'package:mobileapp/data/repositories/ibase_repository.dart';

abstract class IUploadRepository extends IBaseRepository {
  Future<String> uploadImage(String path);
}
