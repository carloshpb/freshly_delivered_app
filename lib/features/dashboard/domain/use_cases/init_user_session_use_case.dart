import 'dart:async';

import '../../../use_case.dart';

abstract class InitUserSessionWithUserIdUseCase
    implements UseCase<String, void> {
  @override
  FutureOr<void> execute(String request);
}
