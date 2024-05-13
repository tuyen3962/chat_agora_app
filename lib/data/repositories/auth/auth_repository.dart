import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/models/custom_response/login_response.dart';
import 'package:mobileapp/data/repositories/auth/iauth_repository.dart';

class AuthRepository extends IAuthRepository {
  AuthRepository({
    required BaseService api,
  }) : _api = api;
  BaseService _api;

  @override
  Future<LoginResponse> loginWithEmail(String username, String password) async {
    try {
      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };

      var response = await _api.client.loginWithEmail(body);
      final account = Account.fromJson(response.results["object"]["result"]);
      final accessToken = response.results["object"]["token"];
      return LoginResponse(account: account, token: accessToken);
    } catch (err) {
      throw handleError(err);
    }
  }
}
