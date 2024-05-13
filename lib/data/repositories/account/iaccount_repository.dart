import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/repositories/ibase_repository.dart';

abstract class IAccountRepository extends IBaseRepository {
  Future<Account> getMyProfile();
  Future<void> saveAccount(Account account);
  Future<bool> deleteAccount(String userId);
  Future<List<Account>> getListAccounts(String userId);
}
