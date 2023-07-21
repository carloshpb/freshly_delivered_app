// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/sign_in_email_password_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/presentation/controllers/login_controller.dart';
import 'package:freshly_delivered_app/routers/app_router.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockSignInEmailPasswordUseCase signInEmailPasswordUseCase;
  late MockGoRouter goRouter;
  late MockListener<AsyncValue<(String, String, bool)>> listener;
  late LoginController controller;

  setUp(() {
    signInEmailPasswordUseCase = MockSignInEmailPasswordUseCase();
    goRouter = MockGoRouter();

    // create the ProviderContainer with the mock use case
    container = ProviderContainer(
      overrides: [
        signInUseCaseProvider.overrideWithValue(
          signInEmailPasswordUseCase,
        ),
        goRouterProvider.overrideWithValue(
          goRouter,
        ),
      ],
    );

    controller = container.read(loginControllerProvider.notifier);

    // create a mock listener
    listener = MockListener<AsyncValue<(String, String, bool)>>();
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is AsyncData', () {
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      loginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // verify
    verify(
      // the build method returns a value immediately, so we expect AsyncData
      listener.call(
          null, const AsyncData<(String, String, bool)>(('', '', false))),
    );
    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
    // verify that [sendPasswordResetEmailUseCase.execute] was not called during initialization
    verifyNever(
        signInEmailPasswordUseCase.execute(request: anyNamed("request")));
    verifyNever(goRouter.pushReplacement(any));
  });

  test('signIn - success', () async {
    // stub method to return success
    when(signInEmailPasswordUseCase.execute(
        request: ('johndoe@example.com', '12345678'))).thenAnswer((_) async {});
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      loginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<(String, String, bool)>(('', '', false));
    const successData = AsyncData<(String, String, bool)>(
        ('johndoe@example.com', '12345678', true));
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // set manually new state for test
    var manualStateData = const AsyncData<(String, String, bool)>(
        ('johndoe@example.com', '12345678', false));
    container.read(loginControllerProvider.notifier).state = manualStateData;
    // run
    await controller.signIn();
    // verify
    verifyInOrder([
      // transition from data to manual state
      listener.call(initialData, manualStateData),
      // transition from manual to loading state
      listener.call(manualStateData, argThat(isA<AsyncLoading>())),
      // transition from loading state to success data
      listener.call(argThat(isA<AsyncLoading>()), successData),
    ]);
    verifyNoMoreInteractions(listener);
    verify(signInEmailPasswordUseCase.execute(request: anyNamed("request")))
        .called(1);
    verify(goRouter.pushReplacement(any)).called(1);
  });

  test('signIn - failure - any Exception', () async {
    // stub method to return success
    when(signInEmailPasswordUseCase.execute(
        request: ('johndoe@example.com', '12345678'))).thenThrow(Exception());
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      loginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<(String, String, bool)>(('', '', false));
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // set manually new state for test
    var manualStateData = const AsyncData<(String, String, bool)>(
        ('johndoe@example.com', '12345678', false));
    container.read(loginControllerProvider.notifier).state = manualStateData;
    // run
    await controller.signIn();
    // verify
    verifyInOrder([
      // transition from data to manual state
      listener.call(initialData, manualStateData),
      // transition from manual to loading state
      listener.call(manualStateData, argThat(isA<AsyncLoading>())),
      // transition from loading state to success data
      listener.call(argThat(isA<AsyncLoading>()), argThat(isA<AsyncError>())),
    ]);

    // verify exception type
    var actualState = container.read(loginControllerProvider);
    expect(actualState, isA<AsyncError>());
    expect(actualState.asError!.error, isA<Exception>());

    verifyNoMoreInteractions(listener);
    verify(signInEmailPasswordUseCase.execute(request: anyNamed("request")))
        .called(1);
    verifyNever(goRouter.pushReplacement(any));
  });

  test('updatePassword', () async {
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      loginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<(String, String, bool)>(('', '', false));
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // run
    controller.updatePassword("12345678");
    // verify
    verify(listener.call(initialData,
        const AsyncData<(String, String, bool)>(('', '12345678', false))));

    verifyNoMoreInteractions(listener);
    verifyNever(
        signInEmailPasswordUseCase.execute(request: anyNamed("request")));
    verifyNever(goRouter.pushReplacement(any));
  });

  test('updateEmail', () async {
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      loginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<(String, String, bool)>(('', '', false));
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // run
    controller.updateEmail("johndoe@example.com");
    // verify
    verify(listener.call(
        initialData,
        const AsyncData<(String, String, bool)>(
            ('johndoe@example.com', '', false))));

    verifyNoMoreInteractions(listener);
    verifyNever(
        signInEmailPasswordUseCase.execute(request: anyNamed("request")));
    verifyNever(goRouter.pushReplacement(any));
  });
}
