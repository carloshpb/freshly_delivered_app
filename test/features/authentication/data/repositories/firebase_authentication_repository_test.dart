import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshly_delivered_app/exceptions/app_auth_exception.dart';
import 'package:freshly_delivered_app/features/authentication/data/repositories/firebase_authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:mockito/mockito.dart';

import '../../../../base_mock.mocks.dart';

void main() {
  late ProviderContainer container;
  late AuthenticationRepository authenticationRepository;
  late MockFirebaseAuth mockFirebaseAuth;

  final MockUser user = MockUser();

  when(user.displayName).thenReturn('John Doe');
  when(user.uid).thenReturn("moc.elpmaxe@eodnhoj");
  when(user.email).thenReturn('johndoe@example.com');
  when(user.isAnonymous).thenReturn(false);

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();

    container = ProviderContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(
          FirebaseAuthenticationRepository(mockFirebaseAuth),
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

    final userCredentials = MockUserCredential();

    when(userCredentials.user).thenReturn(user);

    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .thenAnswer((_) async => userCredentials);

    when(mockFirebaseAuth.currentUser).thenReturn(user);

    var result = await authenticationRepository.signInWithEmailAndPassword(
        email, password);

    final currentUser = authenticationRepository.currentUser;

    expect(
      () => result,
      isA<void>(),
    );
    expect(currentUser, isNotNull);
    expect(currentUser!.email, email);
  });

  test('signInWithEmailAndPassword - wrong password', () async {
    const email = 'johndoe@example.com';
    const password = 'wrongPassword';

    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .thenThrow(FirebaseAuthException(code: "auth/wrong-password"));

    expect(
      () =>
          authenticationRepository.signInWithEmailAndPassword(email, password),
      throwsA(isA<WrongPasswordException>()),
    );
  });

  test('signInWithEmailAndPassword - user not found', () async {
    const email = 'nonexistent@example.com';
    const password = '12345678';

    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .thenThrow(FirebaseAuthException(code: "auth/user-not-found"));

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

    //TODO : Add Firestore test to save user data

    final userCredentials = MockUserCredential();
    final newUser = MockUser();
    when(newUser.displayName).thenReturn('John Doe');
    when(newUser.uid).thenReturn("moc.elpmaxe@resuwen");
    when(newUser.email).thenReturn('newuser@example.com');
    when(newUser.phoneNumber).thenReturn('1234567890');

    when(userCredentials.user).thenReturn(newUser);

    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .thenAnswer((_) async => userCredentials);

    when(mockFirebaseAuth.currentUser).thenReturn(newUser);

    var result = await authenticationRepository.createUserWithEmailAndPassword(
      email,
      password,
      fullName,
      phoneNumber,
    );

    final currentUser = authenticationRepository.currentUser;

    expect(
      () => result,
      isA<void>(),
    );
    expect(currentUser, isNotNull);
    expect(currentUser!.email, email);
  });

  test('createUserWithEmailAndPassword - email already in use', () async {
    const existingUserEmail = 'johndoe@example.com';
    const password = 'password123';
    const fullName = 'John Doe';
    const phoneNumber = '1234567890';

    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: existingUserEmail, password: password))
        .thenThrow(FirebaseAuthException(code: "auth/email-already-in-use"));

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

    when(mockFirebaseAuth.sendPasswordResetEmail(email: existingUserEmail))
        .thenAnswer((_) async {});

    var result = await authenticationRepository
        .sendPasswordResetEmail(existingUserEmail);

    expect(
      () => result,
      isA<void>(),
    );
  });

  test('sendPasswordResetEmail - non-existent user email', () async {
    const nonExistentUserEmail = 'nonexistent@example.com';

    when(mockFirebaseAuth.sendPasswordResetEmail(email: nonExistentUserEmail))
        .thenThrow(FirebaseAuthException(code: "auth/user-not-found"));

    expect(
      () async => await authenticationRepository
          .sendPasswordResetEmail(nonExistentUserEmail),
      throwsA(isA<UserNotFoundException>()),
    );
  });

  test('signOut - clear current user', () async {
    when(mockFirebaseAuth.currentUser).thenReturn(null);

    when(mockFirebaseAuth.signOut()).thenAnswer((_) async {});

    var result = await authenticationRepository.signOut();

    expect(
      () => result,
      isA<void>(),
    );
    expect(authenticationRepository.currentUser, isNull);
  });
}
