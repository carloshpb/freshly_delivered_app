import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../exceptions/app_exception.dart';
import '../../../use_case.dart';

abstract class SignInUseCase
    implements UseCase<(String, String), Result<void, AppException>> {
  @override
  FutureOr<Result<void, AppException>> execute(
      {required (String email, String password) request});
}
