import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/cart_local_repository_impl.dart';
import '../../domain/use_cases/init_user_session_use_case.dart';

final initUserSessionWithUserIdUseCaseProvider =
    Provider.autoDispose<InitUserSessionWithUserIdUseCase>(
  (ref) => InitUserSessionWithUserIdUseCaseImpl(ref),
);

class InitUserSessionWithUserIdUseCaseImpl
    implements InitUserSessionWithUserIdUseCase {
  final Ref _ref;

  InitUserSessionWithUserIdUseCaseImpl(Ref ref) : _ref = ref;

  @override
  Future<void> execute(String request) {
    _ref.watch(cartLocalRepositoryProvider).;
  }
}
