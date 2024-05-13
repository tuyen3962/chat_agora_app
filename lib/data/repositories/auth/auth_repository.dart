import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/models/custom_response/login_response.dart';
import 'package:mobileapp/data/repositories/account/iaccount_repository.dart';
import 'package:mobileapp/data/repositories/auth/iauth_repository.dart';

class AuthRepository extends IAuthRepository {
  AuthRepository({
    required BaseService api,
    required this.accountRepository,
  }) : _api = api;
  BaseService _api;
  final IAccountRepository accountRepository;
  final _auth = FirebaseAuth.instance;

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

  @override
  Future<LoginResponse?> loginWithEmailFirebase(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return LoginResponse(
          account: Account(
            id: userCredential.user?.uid ?? '',
            email: userCredential.user?.email ?? '',
          ),
          token: '');
    } catch (err) {
      return null;
    }
  }

  @override
  Future<LoginResponse> registerEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final account = Account(
        id: userCredential.user?.uid ?? '',
        email: userCredential.user?.email ?? '',
      );
      await accountRepository.saveAccount(account);
      return LoginResponse(account: account, token: '');
    } catch (err) {
      throw handleError(err);
    }
  }

  @override
  Future<Account?> getAccount() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        return Account(
          id: user.uid,
          email: user.email ?? '',
        );
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
