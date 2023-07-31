import 'dart:async';

import '../../../use_case.dart';

abstract class SendPasswordResetEmailUseCase implements UseCase<String, void> {
  @override
  Future<void> execute(String request);
}
