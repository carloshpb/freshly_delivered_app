import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/features/authentication/data/repositories/fake_authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/data/repositories/firebase_authentication_repository.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(
          FakeAuthenticationRepository(addDelay: false),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('signInWithEmailAndPassword - correct credentials', () async {
    final email = 'test@example.com';
    final password = '12345678';

    await repository.signInWithEmailAndPassword(email, password);

    final currentUser = repository.currentUser;
    expect(currentUser, isNotNull);
    expect(currentUser!.email, email);
  });

  test('signInWithEmailAndPassword - wrong password', () async {
    final email = 'test@example.com';
    final password = 'wrongPassword';

    expect(
      () => repository.signInWithEmailAndPassword(email, password),
      throwsA(isA<WrongPasswordException>()),
    );
  });

  test('signInWithEmailAndPassword - user not found', () async {
    final email = 'nonexistent@example.com';
    final password = '12345678';

    expect(
      () => repository.signInWithEmailAndPassword(email, password),
      throwsA(isA<UserNotFoundException>()),
    );
  });

  test('createUserWithEmailAndPassword - valid credentials', () async {
    final email = 'newuser@example.com';
    final password = 'password123';
    final fullName = 'John Doe';
    final phoneNumber = '1234567890';

    await repository.createUserWithEmailAndPassword(
      email,
      password,
      fullName,
      phoneNumber,
    );

    final currentUser = repository.currentUser;
    expect(currentUser, isNotNull);
    expect(currentUser!.email, email);
  });

  test('createUserWithEmailAndPassword - email already in use', () async {
    final existingUserEmail = 'test@example.com';
    final password = 'password123';
    final fullName = 'John Doe';
    final phoneNumber = '1234567890';

    expect(
      () => repository.createUserWithEmailAndPassword(
        existingUserEmail,
        password,
        fullName,
        phoneNumber,
      ),
      throwsA(isA<EmailAlreadyInUseException>()),
    );
  });
}
