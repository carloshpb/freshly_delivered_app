import '../../../use_case.dart';
import '../models/app_user.dart';

abstract class FetchAuthStateUseCase
    implements UseCase<void, Stream<AppUser?>> {
  @override
  Stream<AppUser?> execute([void request]);
}
