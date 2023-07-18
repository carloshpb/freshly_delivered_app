import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// FIREBASE PROVIDERS
///

// final firebaseAuthProvider = Provider<FirebaseAuth>(
//   (ref) => FirebaseAuth.instance,
// );

// final authStateChangesProvider = StreamProvider.autoDispose<User?>(
//   (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
// );

// final firestoreDatabaseProvider = Provider<FirebaseFirestore>(
//   (_) => FirebaseFirestore.instance,
// );

// final firebaseStorageProvider = Provider<FirebaseStorage>(
//   (_) => FirebaseStorage.instance,
// );

// final databaseProvider = Provider.autoDispose<FirestoreDatabase?>((ref) {
//   final auth = ref.watch(authStateChangesProvider);

//   if (auth.asData?.value?.uid != null) {
//     return FirestoreDatabase(uid: auth.asData!.value!.uid);
//   }
//   return null;
// });

///
/// LOCAL STORAGE PROVIDERS
///

// final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
//   (_) => const FlutterSecureStorage(),
// );

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());
