import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/application/use_cases/send_password_reset_email_use_case_impl.dart';
import 'package:freshly_delivered_app/features/authentication/presentation/controllers/forgot_password_login_controller.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late MockSendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;
  late MockListener<AsyncValue<bool>> listener;
  late ForgotPasswordLoginController controller;

  setUp(() {
    sendPasswordResetEmailUseCase = MockSendPasswordResetEmailUseCase();

    // create the ProviderContainer with the mock use case
    container = ProviderContainer(
      overrides: [
        sendPasswordResetEmailUseCaseProvider.overrideWithValue(
          sendPasswordResetEmailUseCase,
        ),
      ],
    );

    controller = container.read(forgotPasswordLoginControllerProvider.notifier);

    // create a mock listener
    listener = MockListener<AsyncValue<bool>>();
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is AsyncData', () {
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      forgotPasswordLoginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // verify
    verify(
      // the build method returns a value immediately, so we expect AsyncData
      listener.call(null, const AsyncData<bool>(false)),
    );
    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
    // verify that [sendPasswordResetEmailUseCase.execute] was not called during initialization
    verifyNever(sendPasswordResetEmailUseCase.execute(anyNamed("request")));
  });

  test('sendPasswordResetEmail - success', () async {
    // stub method to return success
    when(sendPasswordResetEmailUseCase.execute(anyNamed("request")))
        .thenAnswer((_) async {});
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      forgotPasswordLoginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<bool>(false);
    const successData = AsyncData<bool>(true);
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // run
    await controller.sendPasswordResetEmail("johndoe@example.com");
    // verify
    verifyInOrder([
      // transition from data to loading state
      listener.call(initialData, argThat(isA<AsyncLoading>())),
      // transition from loading state to success data
      listener.call(argThat(isA<AsyncLoading>()), successData),
    ]);
    verifyNoMoreInteractions(listener);
    verify(sendPasswordResetEmailUseCase.execute(anyNamed("request")))
        .called(1);
  });

  test('sendPasswordResetEmail - failure - UserNotFoundException', () async {
    // stub method to return success
    when(sendPasswordResetEmailUseCase.execute(anyNamed("request")))
        .thenThrow(const UserNotFoundException());
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      forgotPasswordLoginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<bool>(false);
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // run
    await controller.sendPasswordResetEmail("johndoe@example.com");
    // verify
    verifyInOrder([
      // transition from data to loading state
      listener.call(initialData, argThat(isA<AsyncLoading>())),
      // transition from loading state to error data
      listener.call(argThat(isA<AsyncLoading>()), argThat(isA<AsyncError>())),
    ]);

    // verify exception type
    var actualState = container.read(forgotPasswordLoginControllerProvider);
    expect(actualState, isA<AsyncError>());
    expect(actualState.asError!.error, isA<UserNotFoundException>());

    verifyNoMoreInteractions(listener);
    verify(sendPasswordResetEmailUseCase.execute(anyNamed("request")))
        .called(1);
  });

  test(
      'sendPasswordResetEmail - failure - email blocked - InvalidEmailException',
      () async {
    // stub method to return success
    when(sendPasswordResetEmailUseCase.execute(anyNamed("request")))
        .thenThrow(const InvalidEmailException());
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      forgotPasswordLoginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<bool>(false);
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // run
    await controller.sendPasswordResetEmail("johndoe@example.com");
    // verify
    verifyInOrder([
      // transition from data to loading state
      listener.call(initialData, argThat(isA<AsyncLoading>())),
      // transition from loading state to error data
      listener.call(argThat(isA<AsyncLoading>()), argThat(isA<AsyncError>())),
    ]);

    // verify exception type
    var actualState = container.read(forgotPasswordLoginControllerProvider);
    expect(actualState, isA<AsyncError>());
    expect(actualState.asError!.error, isA<InvalidEmailException>());

    verifyNoMoreInteractions(listener);
    verify(sendPasswordResetEmailUseCase.execute(anyNamed("request")))
        .called(1);
  });

  test('clearState - does as the name says - return to initial state',
      () async {
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      forgotPasswordLoginControllerProvider,
      listener,
      fireImmediately: true,
    );
    // store this into a variable since we'll need it multiple times
    const initialData = AsyncData<bool>(false);
    // verify initial value from the build method
    verify(listener.call(null, initialData));
    // set manually new state
    // ignore: invalid_use_of_protected_member
    container.read(forgotPasswordLoginControllerProvider.notifier).state =
        const AsyncData<bool>(true);
    // clear state
    controller.clearState();
    // verify
    verifyInOrder([
      // transition from data to other state manually
      listener.call(initialData, const AsyncData<bool>(true)),
      // transition from state to initial, after clearState
      listener.call(const AsyncData<bool>(true), const AsyncData<bool>(false)),
    ]);

    verifyNoMoreInteractions(listener);
    verifyNever(sendPasswordResetEmailUseCase.execute(anyNamed("request")));
  });
}
