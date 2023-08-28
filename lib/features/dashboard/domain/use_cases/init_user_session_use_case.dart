import 'dart:async';

import '../../../use_case.dart';

abstract class InitUserSessionWithUserIdUseCase implements UseCase<void, void> {
  @override
  FutureOr<void> execute([void request]);
}
