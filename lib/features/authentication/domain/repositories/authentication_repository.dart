import 'package:multiple_result/multiple_result.dart';

import '../../../../exceptions/app_auth_exception.dart';

abstract class AuthenticationRepository {
  Future<Result<void, AppAuthException>> signIn(String email, String password);
  Future<Result<void, AppAuthException>> signUp(String email, String password);
  Future<Result<void, AppAuthException>> resetPassword(String email);
}
