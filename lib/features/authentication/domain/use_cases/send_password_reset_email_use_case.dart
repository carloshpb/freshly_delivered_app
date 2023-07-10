import 'dart:async';

import '../../../use_case.dart';

abstract class SendPasswordResetEmailUseCase implements UseCase<String, void> {
  @override
  FutureOr<void> execute({required String request});
}
