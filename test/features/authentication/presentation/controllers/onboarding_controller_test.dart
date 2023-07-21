import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/dtos/onboarding_message_dto.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/current_user_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/get_onboarding_messages_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/current_user_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/get_onboarding_messages_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/presentation/controllers/onboarding_controller.dart';
import 'package:freshly_delivered_app/features/authentication/presentation/controllers/states/onboarding_screen_state.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late GetOnboardingMessagesUseCase getOnboardingMessagesUseCase;
  late CurrentUserUseCase currentUserUseCase;
  late MockListener<OnboardingScreenState> listener;
  late OnboardingController controller;

  const defaultOnboardMessages = [
    OnboardingMessageDTO(
      imageSvgPath: 'assets/images/onboarding1.svg.vec',
      title: 'SHOP CONVENIENTLY',
      message:
          'Shop from an unlimited stock of groceries from the convenience of your homes',
    ),
    OnboardingMessageDTO(
      imageSvgPath: 'assets/images/onboarding2.svg.vec',
      title: 'EXPERTLY CURATED RECIPES',
      message:
          'Our recipes are prepared in the finest of conditions by experts in their fields',
    ),
    OnboardingMessageDTO(
      imageSvgPath: 'assets/images/onboarding3.svg.vec',
      title: 'BRING OUT THE CHEF IN YOU',
      message:
          'Our recipes are specially picked so you can get cooking in no time',
    ),
  ];

  const initialState =
      OnboardingScreenState(pagePosition: 0, messages: defaultOnboardMessages);

  setUp(() {
    getOnboardingMessagesUseCase = MockGetOnboardingMessagesUseCase();
    currentUserUseCase = MockCurrentUserUseCase();

    // create the ProviderContainer with the mock use case
    container = ProviderContainer(
      overrides: [
        getOnboardingMessagesUseCaseProvider.overrideWithValue(
          getOnboardingMessagesUseCase,
        ),
        currentUserUseCaseProvider.overrideWithValue(
          currentUserUseCase,
        ),
      ],
    );

    controller = container.read(onboardingControllerProvider.notifier);

    // create a mock listener
    listener = MockListener<OnboardingScreenState>();
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is 0', () {
    var user = const AppUser(uid: "1234", email: "caca");
    // stub method to return success - no error is ever thrown
    when(getOnboardingMessagesUseCase.execute(request: null))
        .thenReturn(defaultOnboardMessages);
    when(currentUserUseCase.execute(request: null)).thenReturn(user);
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      onboardingControllerProvider,
      listener,
      fireImmediately: true,
    );

    verify(getOnboardingMessagesUseCase.execute(request: null)).called(1);

    // verify
    verify(listener.call(null, initialState)).called(1);
    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
    // verify that [sendPasswordResetEmailUseCase.execute] was not called during initialization
    //verify(getOnboardingMessagesUseCase.execute(request: null)).called(1);
  });

  test('onPageChanged - valid index page', () async {
    // stub method to return success - no error is ever thrown
    when(getOnboardingMessagesUseCase.execute(request: null))
        .thenReturn(defaultOnboardMessages);

    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      onboardingControllerProvider,
      listener,
      fireImmediately: true,
    );
    // verify
    print("onPageChanged - valid index page - verify 1");
    verify(
      listener.call(null, initialState),
    ).called(1);
    // run
    controller.onPageChanged(1);
    // verify
    print("onPageChanged - valid index page - verify 2");
    verify(
      listener.call(
          initialState,
          const OnboardingScreenState(
              pagePosition: 1, messages: defaultOnboardMessages)),
    ).called(1);
    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
    // verify that [sendPasswordResetEmailUseCase.execute] was not called during initialization
    verify(getOnboardingMessagesUseCase.execute(request: null)).called(1);
  });

  test('onPageChanged - invalid index page', () async {
    // stub method to return success - no error is ever thrown
    when(getOnboardingMessagesUseCase.execute(request: null))
        .thenReturn(defaultOnboardMessages);
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      onboardingControllerProvider,
      listener,
      fireImmediately: true,
    );
    // verify
    verify(
      listener.call(null, initialState),
    ).called(1);
    // run
    controller.onPageChanged(5);
    // verify
    verifyNever(
      listener.call(
          initialState,
          const OnboardingScreenState(
              pagePosition: 5, messages: defaultOnboardMessages)),
    ).called(1);
    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
    // verify that [sendPasswordResetEmailUseCase.execute] was not called during initialization
    verify(getOnboardingMessagesUseCase.execute(request: null)).called(1);
  });

  // test('get onboardingMessages', () async {
  //   // stub method to return success - no error is ever thrown
  //   when(getOnboardingMessagesUseCase.execute(request: null))
  //       .thenReturn(defaultOnboardMessages);
  //   // listen to the provider and call [listener] whenever its value changes
  //   container.listen(
  //     onboardingControllerProvider,
  //     listener,
  //     fireImmediately: true,
  //   );
  //   // verify
  //   verify(
  //     listener.call(null, initialState),
  //   ).called(1);
  //   // run
  //   var messages = controller.onboardingMessages;
  //   // verify
  //   expect(messages, equals(defaultOnboardMessages));
  //   // verify that the listener is no longer called
  //   verifyNoMoreInteractions(listener);
  //   // verify that [sendPasswordResetEmailUseCase.execute] was not called during initialization
  //   verify(getOnboardingMessagesUseCase.execute(request: null))
  //       .called(1);
  // });
}