import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';

import '../../../../exceptions/app_auth_exception.dart';
import '../../../dashboard/data/apis/local/impl/sqlite_api_impl.dart';
import '../../../dashboard/data/apis/remote/impl/firestore_api_impl.dart';
import '../../domain/repositories/authentication_repository.dart';

final authenticationRepositoryProvider =
    AsyncNotifierProvider<AuthenticationRepository, AppUser>(
  () => FirebaseAuthenticationRepository(FirebaseAuth.instance),
  name: r"authenticationRepositoryProvider",
);

class FirebaseAuthenticationRepository extends AsyncNotifier<AppUser>
    implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthenticationRepository(this._firebaseAuth);

  @override
  FutureOr<AppUser> build() async {
    var user = _firebaseAuth.currentUser;
    if (user == null) {
      return const AppUser.notConnected();
    }
    var sqliteDB = ref.watch(sqliteApiProvider);
    try {
      var userDataJson = await sqliteDB.findById("connected_user", user.uid);
      var userData = (userDataJson.isNotEmpty)
          ? UserData.fromJson(userDataJson)
          : const AppUser.notConnected();
      if (userData is UserData) {
        return userData;
      }
      var firestore = ref.watch(firestoreApiProvider);
      userDataJson = await firestore.findById("user_personal_data", user.uid);
      userData = (userDataJson.isNotEmpty)
          ? UserData.fromJson(userDataJson)
          : AppUser.noPersonalData(
              uid: user.uid,
              email: (user.email != null) ? user.email! : '',
            );
      return userData;
    } on Exception {
      // TODO : Treat bad exceptions from user side
      return const AppUser.notConnected();
    }
  }

  @override
  Stream<AppUser?> authStateChanges() {
    var authState = _firebaseAuth.authStateChanges();
    return authState.asyncMap<AppUser?>((user) async {
      if (user == null) {
        state = const AsyncValue.data(AppUser.notConnected());
        return state.value!;
      }
      var sqliteDB = ref.watch(sqliteApiProvider);
      try {
        state = const AsyncLoading();
        var userDataJson = await sqliteDB.findById("connected_user", user.uid);
        state = (userDataJson.isNotEmpty)
            ? AsyncData(UserData.fromJson(userDataJson))
            : const AsyncLoading();
        // var userData = (userDataJson.isNotEmpty)
        //     ? UserData.fromJson(userDataJson)
        //     : const AppUser.notConnected();
        if (state.value! is UserData) {
          return state.value!;
        }
        var firestore = ref.watch(firestoreApiProvider);
        userDataJson = await firestore.findById("user_personal_data", user.uid);
        state = (userDataJson.isNotEmpty)
            ? AsyncData(UserData.fromJson(userDataJson))
            : AsyncData(AppUser.noPersonalData(
                uid: user.uid,
                email: (user.email != null) ? user.email! : '',
              ));
        // userData = (userDataJson.isNotEmpty)
        //     ? UserData.fromJson(userDataJson)
        //     : AppUser.noPersonalData(
        //         uid: user.uid,
        //         email: (user.email != null) ? user.email! : '',
        //       );
        return state.value!;
      } on Exception {
        // TODO : Treat bad exceptions from user side
        state = const AsyncValue.data(AppUser.notConnected());
        return state.value!;
      }
    });
  }

  // @override
  // AppUser get currentUser {
  //   var user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     return const AppUser.notConnected();
  //   }
  //   return AppUser(
  //     uid: user.uid,
  //     email: user.email!,
  //   );
  // }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // invalid-email , user-disabled , user-not-found , wrong-password
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
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }
}
