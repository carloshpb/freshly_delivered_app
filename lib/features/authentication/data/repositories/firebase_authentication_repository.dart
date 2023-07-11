import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';

import '../../../../exceptions/app_auth_exception.dart';
import '../../domain/repositories/authentication_repository.dart';

final authenticationRepositoryProvider =
    Provider.autoDispose<AuthenticationRepository>(
  (ref) {
    final auth = FirebaseAuthenticationRepository();
    ref.keepAlive();
    return auth;
  },
  name: r"authenticationRepositoryProvider",
);

final authStateChangesProvider = Provider.autoDispose<Stream<AppUser?>>(
  (ref) {
    final authRepository = ref.watch(authenticationRepositoryProvider);
    ref.keepAlive();
    return authRepository.authStateChanges();
  },
  name: r"authStateChangesProvider",
);

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<AppUser?> authStateChanges() {
    var authState = _firebaseAuth.authStateChanges();
    return authState.map<AppUser?>((userData) {
      if (userData == null) {
        return null;
      }
      return AppUser(
        uid: userData.uid,
        email: userData.email!,
      );
    });
  }

  @override
  AppUser? get currentUser {
    var user = _firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }
    return AppUser(
      uid: user.uid,
      email: user.email!,
    );
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password,
      String fullName, String phoneNumber) async {
    // TODO : Store fullname and phone
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }

  @override
  Future<void> confirmPasswordReset(String code, String newPassword) async {
    try {
      await _firebaseAuth.confirmPasswordReset(
          code: code, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }
}
