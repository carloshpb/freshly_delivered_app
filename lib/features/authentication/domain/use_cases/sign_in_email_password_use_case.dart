import 'dart:async';

import '../../../use_case.dart';

abstract class SignInEmailPasswordUseCase
    implements UseCase<(String, String), void> {
  @override
  FutureOr<void> execute((String email, String password) request);
}
