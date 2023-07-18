import '../models/app_user.dart';

abstract class AuthenticationRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String fullName, String phoneNumber);
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
}
