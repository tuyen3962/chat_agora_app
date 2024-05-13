import 'package:get/get.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';
import 'package:mobileapp/data/repositories/auth/iauth_repository.dart';
import 'package:mobileapp/data/service/local_service.dart';

class AccountService extends BaseService {
  LocalService localService;
  IAccountRepository accountRepository;
  IAuthRepository authRepository;
  AccountService({
    required this.localService,
    required this.accountRepository,
    required this.authRepository,
  });

  var me = Rx<Account?>(null);
  Account? get myAccount => me.value;

  setAccount(Account? account) {
    me.value = account;
  }

  // cacheAccessToken(String accessToken) {
  //   localService.cacheToken(accessToken);
  // }

  // cacheId(String id) {
  //   localService.cacheId(id);
  // }

  // logout() {
  //   localService.clear();
  // }
}
