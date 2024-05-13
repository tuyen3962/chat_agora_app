import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/models/custom_response/login_response.dart';
import 'package:mobileapp/data/repositories/ibase_repository.dart';

abstract class IAuthRepository extends IBaseRepository {
  Future<LoginResponse> loginWithEmail(String username, String password);
  Future<Account?> getAccount();
  Future<LoginResponse?> loginWithEmailFirebase(String email, String password);
  Future<LoginResponse> registerEmailPassword(String email, String password);
}
