import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/data/repositories/fake_authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/data/repositories/firebase_authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';

void main() {
  late ProviderContainer container;
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(
          FakeAuthenticationRepository(addDelay: false),
        ),
      ],
    );

    authenticationRepository = container.read(authenticationRepositoryProvider);
  });

  tearDown(() {
    container.dispose();
  });

  test('signInWithEmailAndPassword - correct credentials', () async {
    const email = 'johndoe@example.com';
    const password = '12345678';

    await authenticationRepository.signInWithEmailAndPassword(email, password);

    final currentUser = authenticationRepository.currentUser;
    expect(currentUser, isNotNull);
    expect(currentUser!.email, email);
  });

  test('signInWithEmailAndPassword - wrong password', () async {
    const email = 'johndoe@example.com';
    const password = 'wrongPassword';

    expect(
      () =>
          authenticationRepository.signInWithEmailAndPassword(email, password),
      throwsA(isA<WrongPasswordException>()),
    );
  });

  test('signInWithEmailAndPassword - user not found', () async {
    const email = 'nonexistent@example.com';
    const password = '12345678';

    expect(
      () =>
          authenticationRepository.signInWithEmailAndPassword(email, password),
      throwsA(isA<UserNotFoundException>()),
    );
  });

  test('createUserWithEmailAndPassword - valid credentials', () async {
    const email = 'newuser@example.com';
    const password = 'password123';
    const fullName = 'John Doe';
    const phoneNumber = '1234567890';

    await authenticationRepository.createUserWithEmailAndPassword(
      email,
      password,
      fullName,
      phoneNumber,
    );

    final currentUser = authenticationRepository.currentUser;
    expect(currentUser, isNotNull);
    expect(currentUser!.email, email);
  });

  test('createUserWithEmailAndPassword - email already in use', () async {
    const existingUserEmail = 'johndoe@example.com';
    const password = 'password123';
    const fullName = 'John Doe';
    const phoneNumber = '1234567890';

    expect(
      () => authenticationRepository.createUserWithEmailAndPassword(
        existingUserEmail,
        password,
        fullName,
        phoneNumber,
      ),
      throwsA(isA<EmailAlreadyInUseException>()),
    );
  });

  test('sendPasswordResetEmail - existing user email', () async {
    const existingUserEmail = 'johndoe@example.com';

    var result = await authenticationRepository
        .sendPasswordResetEmail(existingUserEmail);

    expect(
      () => result,
      isA<void>(),
    );
  });

  test('sendPasswordResetEmail - non-existent user email', () async {
    const nonExistentUserEmail = 'nonexistent@example.com';

    expect(
      () async => await authenticationRepository
          .sendPasswordResetEmail(nonExistentUserEmail),
      throwsA(isA<UserNotFoundException>()),
    );
  });

  test('signOut - clear current user', () async {
    const email = 'johndoe@example.com';
    const password = '12345678';

    await authenticationRepository.signInWithEmailAndPassword(email, password);

    var result = await authenticationRepository.signOut();

    expect(
      () => result,
      isA<void>(),
    );
    expect(authenticationRepository.currentUser, isNull);
  });
}
