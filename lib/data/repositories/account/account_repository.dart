import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';

class AccountRepository extends IAccountRepository {
  AccountRepository({
    required BaseService api,
  }) : _api = api;
  BaseService _api;

  @override
  Future<Account> getMyProfile() async {
    try {
      var response = await _api.client.getMyProfile(
        {
          "fields": '["\$all"]',
        },
      );

      return response.parse((map) => Account.fromJson(map));
    } catch (err) {
      throw handleError(err);
    }
  }

  @override
  Future<bool> deleteAccount(String userId) async {
    try {
      var response = await _api.client.deleteAccount(userId);
      return response.code == 200;
    } catch (err) {
      throw handleError(err);
    }
  }
}
