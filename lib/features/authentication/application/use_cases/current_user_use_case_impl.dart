import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/firebase_authentication_repository.dart';
import '../../domain/models/app_user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/use_cases/current_user_use_case.dart';

final currentUserUseCaseProvider = Provider.autoDispose<CurrentUserUseCase>(
  (ref) {
    return CurrentUserUseCaseImpl(
      authRepository: ref.watch(authenticationRepositoryProvider),
    );
  },
  name: r"currentUserUseCaseProvider",
);

class CurrentUserUseCaseImpl implements CurrentUserUseCase {
  final AuthenticationRepository _authRepository;

  CurrentUserUseCaseImpl({required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  AppUser? execute({required void request}) {
    return _authRepository.currentUser;
  }
}
