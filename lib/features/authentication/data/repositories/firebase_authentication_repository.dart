import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/authentication/domain/models/app_user.dart';

import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../dashboard/data/apis/local/impl/sqlite_api_impl.dart';
import '../../../dashboard/data/apis/local/sqlite_api.dart';
import '../../../dashboard/data/apis/remote/firestore_api.dart';
import '../../../dashboard/data/apis/remote/impl/firestore_api_impl.dart';
import '../../domain/repositories/authentication_repository.dart';

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => FirebaseAuthenticationRepository(
    FirebaseAuth.instance,
    ref.watch(sqliteApiProvider),
    ref.watch(firestoreApiProvider),
  ),
  name: r"authenticationRepositoryProvider",
);

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final SQLiteApi _sqLiteApi;
  final FirestoreApi _firestoreApi;

  FirebaseAuthenticationRepository(
    this._firebaseAuth,
    this._sqLiteApi,
    this._firestoreApi,
  );

  // @override
  // FutureOr<AppUser> build() async {
  //   var user = _firebaseAuth.currentUser;
  //   if (user == null) {
  //     return const AppUser.notConnected();
  //     //  TODO : clean cache
  //   }
  //   var sqliteDB = ref.watch(sqliteApiProvider);
  //   try {
  //     var userDataJson =
  //         await sqliteDB.findById(Strings.appUserLocalTable, user.uid);
  //     var userData = (userDataJson.isNotEmpty)
  //         ? UserData.fromJson(userDataJson)
  //         : const AppUser.notConnected();
  //     if (userData is UserData) {
  //       return userData;
  //     }
  //     var firestore = ref.watch(firestoreApiProvider);
  //     userDataJson =
  //         await firestore.findById(Strings.appUserRemoteTable, user.uid);
  //     userData = UserData.fromJson(userDataJson);
  //     return userData;
  //   } on Exception {
  //     // TODO : Treat bad exceptions from user side
  //     return const AppUser.notConnected();
  //   }
  // }

  @override
  Stream<AppUser?> authStateChanges() {
    var authState = _firebaseAuth.authStateChanges();
    return authState.asyncMap<AppUser?>((user) async {
      if (user == null) {
        _sqLiteApi.clearDatabase();
        return const AppUser.notConnected();
      }
      try {
        var userDataJson =
            await _sqLiteApi.findById(Strings.appUserLocalTable, user.uid);
        // var = (userDataJson.isNotEmpty)
        //     ? AsyncData(UserData.fromJson(userDataJson))
        //     : const AsyncLoading();
        // var userData = (userDataJson.isNotEmpty)
        //     ? UserData.fromJson(userDataJson)
        //     : const AppUser.notConnected();
        if (userDataJson.isNotEmpty) {
          return UserData.fromJson(userDataJson);
        }
        // var firestore = ref.watch(firestoreApiProvider);
        userDataJson =
            await _firestoreApi.findById(Strings.appUserRemoteTable, user.uid);

        if (userDataJson.isNotEmpty) {
          _sqLiteApi.save(
            Strings.appUserLocalTable,
            userDataJson,
            userDataJson.keys.toList(),
          );
          return UserData.fromJson(userDataJson);
        } else {
          throw const AppAuthException.userNotFound();
        }
        // state = AsyncData(UserData.fromJson(userDataJson));
        // userData = (userDataJson.isNotEmpty)
        //     ? UserData.fromJson(userDataJson)
        //     : AppUser.noPersonalData(
        //         uid: user.uid,
        //         email: (user.email != null) ? user.email! : '',
        //       );
        // return state.value!;
      } on Exception {
        // TODO : Treat bad exceptions from user side
        // state = const AsyncValue.data(AppUser.notConnected());
        // return state.value!;
        rethrow;
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
    UserCredential? result;
    try {
      //state = const AsyncValue.loading();
      result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        Map<String, dynamic> userJson = await _firestoreApi.findById(
          Strings.appUserRemoteTable,
          result.user!.uid,
        );
        var fullUser = UserData.fromJson(userJson);

        // state = AsyncValue.data(fullUser);

        // var sqliteDB = ref.watch(sqliteApiProvider);
        await _sqLiteApi.save(
          Strings.appUserLocalTable,
          userJson,
          userJson.keys.toList(),
        );
      }
    } on FirebaseAuthException catch (e) {
      // invalid-email , user-disabled , user-not-found , wrong-password
      if (result != null && result.user != null) {
        await signOut();
      }
      throw e.convertToAppException();
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password,
      String fullName, String phoneNumber) async {
    UserCredential? result;
    try {
      // state = const AsyncValue.loading();
      result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        var fullUserJson = UserData(
          uid: result.user!.uid,
          email: email,
          password: password,
          fullname: fullName,
          phoneNumber: phoneNumber,
        ).toJson();
        await _firestoreApi.save(
          Strings.appUserRemoteTable,
          fullUserJson,
        );

        await _sqLiteApi.save(
          Strings.appUserLocalTable,
          fullUserJson,
          fullUserJson.keys.toList(),
        );

        // state = AsyncValue.data(fullUser);
      }
    } on FirebaseAuthException catch (e) {
      if (result != null && result.user != null) {
        await result.user!.delete();
      }
      throw e.convertToAppException();
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      // var oldState = state.value;
      // state = const AsyncValue.loading();
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      // state = AsyncValue.data(oldState!);
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // state = const AsyncValue.loading();
      await _firebaseAuth.signOut();
      // state = const AsyncValue.data(AppUser.notConnected());
    } on FirebaseAuthException catch (e) {
      throw e.convertToAppException();
    }
  }
}

// final authenticationRepositoryProvider =
//     AsyncNotifierProvider<AuthenticationRepository, AppUser>(
//   () => FirebaseAuthenticationRepository(FirebaseAuth.instance),
//   name: r"authenticationRepositoryProvider",
// );

// class FirebaseAuthenticationRepository extends AsyncNotifier<AppUser>
//     implements AuthenticationRepository {
//   final FirebaseAuth _firebaseAuth;

//   FirebaseAuthenticationRepository(this._firebaseAuth);

//   @override
//   FutureOr<AppUser> build() async {
//     var user = _firebaseAuth.currentUser;
//     if (user == null) {
//       return const AppUser.notConnected();
//       //  TODO : clean cache
//     }
//     var sqliteDB = ref.watch(sqliteApiProvider);
//     try {
//       var userDataJson =
//           await sqliteDB.findById(Strings.appUserLocalTable, user.uid);
//       var userData = (userDataJson.isNotEmpty)
//           ? UserData.fromJson(userDataJson)
//           : const AppUser.notConnected();
//       if (userData is UserData) {
//         return userData;
//       }
//       var firestore = ref.watch(firestoreApiProvider);
//       userDataJson =
//           await firestore.findById(Strings.appUserRemoteTable, user.uid);
//       userData = UserData.fromJson(userDataJson);
//       return userData;
//     } on Exception {
//       // TODO : Treat bad exceptions from user side
//       return const AppUser.notConnected();
//     }
//   }

//   @override
//   Stream<AppUser?> authStateChanges() {
//     var authState = _firebaseAuth.authStateChanges();
//     return authState.asyncMap<AppUser?>((user) async {
//       if (user == null) {
//         state = const AsyncValue.data(AppUser.notConnected());
//         return state.value!;
//       }
//       var sqliteDB = ref.watch(sqliteApiProvider);
//       try {
//         state = const AsyncLoading();
//         var userDataJson =
//             await sqliteDB.findById(Strings.appUserLocalTable, user.uid);
//         state = (userDataJson.isNotEmpty)
//             ? AsyncData(UserData.fromJson(userDataJson))
//             : const AsyncLoading();
//         // var userData = (userDataJson.isNotEmpty)
//         //     ? UserData.fromJson(userDataJson)
//         //     : const AppUser.notConnected();
//         if (state.value! is UserData) {
//           return state.value!;
//         }
//         var firestore = ref.watch(firestoreApiProvider);
//         userDataJson =
//             await firestore.findById(Strings.appUserRemoteTable, user.uid);
//         state = AsyncData(UserData.fromJson(userDataJson));
//         // userData = (userDataJson.isNotEmpty)
//         //     ? UserData.fromJson(userDataJson)
//         //     : AppUser.noPersonalData(
//         //         uid: user.uid,
//         //         email: (user.email != null) ? user.email! : '',
//         //       );
//         return state.value!;
//       } on Exception {
//         // TODO : Treat bad exceptions from user side
//         state = const AsyncValue.data(AppUser.notConnected());
//         return state.value!;
//       }
//     });
//   }

//   // @override
//   // AppUser get currentUser {
//   //   var user = _firebaseAuth.currentUser;
//   //   if (user == null) {
//   //     return const AppUser.notConnected();
//   //   }
//   //   return AppUser(
//   //     uid: user.uid,
//   //     email: user.email!,
//   //   );
//   // }

//   @override
//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     UserCredential? result;
//     try {
//       state = const AsyncValue.loading();
//       result = await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       if (result.user != null) {
//         Map<String, dynamic> userJson =
//             await ref.watch(firestoreApiProvider).findById(
//                   Strings.appUserRemoteTable,
//                   result.user!.uid,
//                 );
//         var fullUser = UserData.fromJson(userJson);

//         state = AsyncValue.data(fullUser);

//         var sqliteDB = ref.watch(sqliteApiProvider);
//         await sqliteDB.save(
//           Strings.appUserLocalTable,
//           userJson,
//           userJson.keys.toList(),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       // invalid-email , user-disabled , user-not-found , wrong-password
//       if (result != null && result.user != null) {
//         await signOut();
//       }
//       throw e.convertToAppException();
//     }
//   }

//   @override
//   Future<void> createUserWithEmailAndPassword(String email, String password,
//       String fullName, String phoneNumber) async {
//     UserCredential? result;
//     try {
//       state = const AsyncValue.loading();
//       result = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (result.user != null) {
//         var fullUser = UserData(
//           uid: result.user!.uid,
//           email: email,
//           password: password,
//           fullname: fullName,
//           phoneNumber: phoneNumber,
//         );
//         await ref.watch(firestoreApiProvider).save(
//               Strings.appUserRemoteTable,
//               fullUser.toJson(),
//             );

//         state = AsyncValue.data(fullUser);
//       }
//     } on FirebaseAuthException catch (e) {
//       if (result != null && result.user != null) {
//         await result.user!.delete();
//       }
//       throw e.convertToAppException();
//     }
//   }

//   @override
//   Future<void> sendPasswordResetEmail(String email) async {
//     try {
//       var oldState = state.value;
//       state = const AsyncValue.loading();
//       await _firebaseAuth.sendPasswordResetEmail(email: email);
//       state = AsyncValue.data(oldState!);
//     } on FirebaseAuthException catch (e) {
//       throw e.convertToAppException();
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     try {
//       state = const AsyncValue.loading();
//       await _firebaseAuth.signOut();
//       state = const AsyncValue.data(AppUser.notConnected());
//     } on FirebaseAuthException catch (e) {
//       throw e.convertToAppException();
//     }
//   }
// }
