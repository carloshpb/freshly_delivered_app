import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';

import '../../domain/use_cases/fetch_auth_state_use_case.dart';

class FetchAuthStateUseCaseImpl implements FetchAuthStateUseCase {

  final AuthenticationRepository _authRepository;

  CurrentUserUseCaseImpl({required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  @override
  Stream<AppUser?> execute([void request]) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
