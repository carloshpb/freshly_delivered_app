import '../../../use_case.dart';

abstract class AddOnboardingMessageUseCase
    implements
        UseCase<({String imageSvgPath, String title, String message}), void> {
  @override
  void execute(
      {required ({String imageSvgPath, String title, String message}) request});
}
