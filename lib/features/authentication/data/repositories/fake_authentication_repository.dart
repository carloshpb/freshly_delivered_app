// import 'dart:async';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../constants/strings.dart';
// import '../../../../exceptions/app_auth_exception.dart';
// import '../../../../exceptions/app_sqflite_exception.dart';
// import '../../../../utils/delay.dart';
// import '../../../../utils/in_memory_store.dart';
// import '../../../dashboard/data/apis/local/impl/sqlite_api_impl.dart';
// import '../../domain/models/app_user.dart';
// import '../../domain/repositories/authentication_repository.dart';

// class FakeAuthenticationRepository extends AsyncNotifier<AppUser>
//     implements AuthenticationRepository {
//   final bool _addDelay;
//   final _authState = InMemoryStore<UserData?>(null);
//   final _fakeUser = UserData(
//     uid: Strings.sampleEmail.split('').reversed.join(),
//     email: Strings.sampleEmail,
//     fullname: Strings.sampleFullname,
//     password: "12345678",
//     phoneNumber: Strings.samplePhoneNumber,
//   );

//   FakeAuthenticationRepository({bool addDelay = true}) : _addDelay = addDelay;

//   @override
//   FutureOr<AppUser> build() async {
//     if (_authState.value == null) {
//       return const AppUser.notConnected();
//     }
//     var sqliteDB = ref.watch(sqliteApiProvider);
//     try {
//       var userDataJson =
//           await sqliteDB.findById("connected_user", _authState.value!.uid);
//       var userData = (userDataJson.isNotEmpty)
//           ? UserData.fromJson(userDataJson)
//           : const AppUser.notConnected();
//       switch (userData) {
//         case UserData():
//           return userData;
//         default:
//           var fakeUserMap = _fakeUser.toJson();
//           var saveResult = await sqliteDB.save(
//             "connected_user",
//             fakeUserMap,
//             fakeUserMap.keys.toList(),
//           );
//           if (saveResult == 0) {
//             // TODO : Make it better
//             throw const AppSqfliteException.failInsert();
//           }
//           return _fakeUser;
//       }
//     } on Exception {
//       // TODO : Treat bad exceptions from user side
//       return const AppUser.notConnected();
//     }
//   }

//   @override
//   Stream<AppUser?> authStateChanges() {
//     return _authState.stream.asyncMap<AppUser?>((user) async {
//       if (user == null) {
//         state = const AsyncValue.data(AppUser.notConnected());
//         return state.value!;
//       }
//       var sqliteDB = ref.watch(sqliteApiProvider);
//       try {
//         state = const AsyncLoading();
//         var userDataJson = await sqliteDB.findById("connected_user", user.uid);
//         state = (userDataJson.isNotEmpty)
//             ? AsyncData(UserData.fromJson(userDataJson))
//             : const AsyncLoading();
//         if (state.value! is UserData) {
//           return state.value!;
//         }

//         var fakeUserMap = _fakeUser.toJson();
//         var saveResult = await sqliteDB.save(
//           "connected_user",
//           fakeUserMap,
//           fakeUserMap.keys.toList(),
//         );
//         if (saveResult == 0) {
//           // TODO : Make it better
//           throw const AppSqfliteException.failInsert();
//         }
//         return _fakeUser;
//       } on Exception {
//         // TODO : Treat bad exceptions from user side
//         state = const AsyncValue.data(AppUser.notConnected());
//         return state.value!;
//       }
//     });
//   }

//   // List to keep track of all user accounts
//   // final List<AppUser> _users = [
//   //   UserData(
//   //     uid: Strings.sampleEmail.split('').reversed.join(),
//   //     email: Strings.sampleEmail,
//   //     fullname: Strings.sampleFullname,
//   //     password: "12345678",
//   //     phoneNumber: Strings.samplePhoneNumber,
//   //   ),
//   // ];
//   final Map<String, String> _resetCode = {};

//   @override
//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     await delay(_addDelay);
//     // check the given credentials agains each registered user
//     for (final u in _users) {
//       // matching email and password
//       if (u.email == email && u.password == password) {
//         _authState.value = u;
//         return;
//       }
//       // same email, wrong password
//       if (u.email == email && u.password != password) {
//         throw const WrongPasswordException();
//       }
//     }
//     throw const UserNotFoundException();
//   }

//   @override
//   Future<void> createUserWithEmailAndPassword(String email, String password,
//       String fullName, String phoneNumber) async {
//     await delay(_addDelay);
//     // check if the email is already in use
//     for (final u in _users) {
//       if (u.email == email) {
//         throw const EmailAlreadyInUseException();
//       }
//     }
//     // minimum password length requirement
//     if (password.length < 8) {
//       throw const WeakPasswordException();
//     }
//     // create new user
//     _createNewUser(email, password, fullName, phoneNumber);
//   }

//   @override
//   Future<void> signOut() async {
//     _authState.value = null;
//   }

//   void dispose() => _authState.close();

//   void _createNewUser(
//       String email, String password, String fullName, String phoneNumber) {
//     // create new user
//     final user = UserData(
//       uid: email.split('').reversed.join(),
//       email: email,
//       password: password,
//       fullname: fullName,
//       phoneNumber: phoneNumber,
//     );
//     // register it
//     _users.add(user);
//     // update the auth state
//     _authState.value = user;
//   }

//   @override
//   Future<void> sendPasswordResetEmail(String email) async {
//     await delay(_addDelay);

//     for (final u in _users) {
//       if (u.email == email) {
//         _resetCode[email] = "123456";
//         return;
//       }
//     }

//     throw const UserNotFoundException();
//   }
// }
