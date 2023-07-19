import '../../../use_case.dart';

abstract class SetOnboardingMessagesUseCase
    implements
        UseCase<List<({String imageSvgPath, String title, String message})>,
            void> {
  @override
  void execute(
      {required List<({String imageSvgPath, String title, String message})>
          request});
}
