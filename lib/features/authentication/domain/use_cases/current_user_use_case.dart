import '../../../use_case.dart';
import '../models/app_user.dart';

abstract class CurrentUserUseCase implements UseCase<void, AppUser?> {
  @override
  AppUser? execute({required dynamic request});
}
