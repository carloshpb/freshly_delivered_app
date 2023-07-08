import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../exceptions/app_auth_exception.dart';
import '../../domain/repositories/authentication_repository.dart';

final firebaseAuthenticationRepositoryProvider =
    Provider<FirebaseAuthenticationRepository>(
  (ref) {
    return FirebaseAuthenticationRepository();
  },
  name: r"firebaseAuthenticationRepositoryProvider",
);

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<AppUser?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => throw UnimplementedError();

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
