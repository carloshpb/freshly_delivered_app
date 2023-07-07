import 'package:multiple_result/multiple_result.dart';

import '../../../../exceptions/app_exception.dart';

abstract class AuthenticationRepository {
  Future<Result<void, AppException>> signIn(String email, String password);
  Future<Result<void, AppException>> signUp(String email, String password);
  Future<Result<void, AppException>> resetPassword(String email);
}
