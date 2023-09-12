import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/firebase_authentication_repository.dart';
import '../dtos/app_user_dto.dart';

final authStateUseCaseProvider = StreamProvider<AppUserDto>(
  (ref) {
    // ref.onDispose(ref
    //     .watch(authenticationRepositoryProvider)
    //     .authStateChanges().);
    return ref
        .watch(authenticationRepositoryProvider)
        .authStateChanges()
        .asyncMap((event) => AppUserDto.fromDomain(event));
  },
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
