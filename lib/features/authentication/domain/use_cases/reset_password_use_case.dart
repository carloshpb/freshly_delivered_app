import 'dart:async';

import '../../../use_case.dart';

abstract class ResetPasswordUseCase implements UseCase<String, void> {
  @override
  FutureOr<void> execute({required String request});
}
