import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../exceptions/app_auth_exception.dart';
import '../../../use_case.dart';

abstract class SignInUseCase
    implements UseCase<(String, String), Result<void, AppAuthException>> {
  @override
  FutureOr<Result<void, AppAuthException>> execute(
      {required (String email, String password) request});
}
