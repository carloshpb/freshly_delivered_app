import '../../../use_case.dart';

abstract class GetOnboardingMessagesUseCase
    implements
        UseCase<void,
            List<(String imageSvgPath, String title, String message)>> {
  @override
  List<(String imageSvgPath, String title, String message)> execute(
      {required void request});
}
