import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileapp/common/config/app_constants.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';

class AccountRepository extends IAccountRepository {
  AccountRepository({
    required BaseService api,
  }) : _api = api;
  BaseService _api;
  final firestore = FirebaseFirestore.instance;

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

  @override
  Future<void> saveAccount(Account account) async {
    try {
      await firestore.collection(CollectionName.USERS).doc(account.id).set(account.toJson());
    } catch (err) {
      throw handleError(err);
    }
  }

  @override
  Future<List<Account>> getListAccounts(String userId) async {
    try {
      final docs = await firestore.collection(CollectionName.USERS).where('id', isNotEqualTo: userId).get();
      // await firestore.collection(CollectionName.USERS).doc(account.id).set(account.toJson());
      if (docs.docs.isNotEmpty) {
        return docs.docs.map((e) => Account.fromJson(e.data())).toList();
      }
    } catch (err) {
      print(err);
    }

    return [];
  }
}
