import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';

import '../../data/repositories/firebase_authentication_repository.dart';

final authStateUseCaseProvider = StreamProvider<AppUser?>(
  (ref) => ref.watch(authenticationRepositoryProvider).authStateChanges(),
);

// class AuthStateUseCaseImpl implements AuthStateUseCase {
//   final AuthenticationRepository _authRepository;

//   AuthStateUseCaseImpl({required AuthenticationRepository authRepository})
//       : _authRepository = authRepository;

//   @override
//   Stream<AppUser?> execute([void request]) {
//     return _authRepository.authStateChanges();
//   }
// }
