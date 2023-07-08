import 'dart:async';

import '../../../use_case.dart';

abstract class SignUpEmailPasswordUseCase
    implements UseCase<(String, String), void> {
  @override
  FutureOr<void> execute({required (String email, String password) request});
}