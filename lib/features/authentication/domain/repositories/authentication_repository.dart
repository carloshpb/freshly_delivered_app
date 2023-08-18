import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/app_user.dart';

abstract class AuthenticationRepository implements AsyncNotifier<AppUser> {
  Stream<AppUser?> authStateChanges();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String fullName, String phoneNumber);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
}
