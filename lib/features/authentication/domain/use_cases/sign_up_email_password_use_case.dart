import 'dart:async';

import '../../../use_case.dart';

abstract class SignUpEmailPasswordUseCase
    implements UseCase<(String, String, String, String), void> {
  @override
  FutureOr<void> execute(
      (
        String email,
        String password,
        String fullName,
        String phoneNumber
      ) request);
}
