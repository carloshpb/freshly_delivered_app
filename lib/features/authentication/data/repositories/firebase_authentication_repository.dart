import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  Future<Result<void, AppAuthException>> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      return Error(e.convertToAppException());
    }
  }

  @override
  Future<Result<void, AppAuthException>> signIn(
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
  Future<Result<void, AppAuthException>> signUp(
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
