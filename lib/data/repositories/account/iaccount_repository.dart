import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/repositories/ibase_repository.dart';

abstract class IAccountRepository extends IBaseRepository {
  Future<Account> getMyProfile();
  Future<bool> deleteAccount(String userId);
}
