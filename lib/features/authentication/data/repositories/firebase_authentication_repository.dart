import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';
import 'package:multiple_result/multiple_result.dart';

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
  Future<Result<void, AppAuthException>> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Error(e.convertToAppException());
    }
  }

  @override
  Future<Result<void, AppAuthException>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Error(e.convertToAppException());
    }
  }

  @override
  Future<Result<void, AppAuthException>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Error(e.convertToAppException());
    }
  }
}
