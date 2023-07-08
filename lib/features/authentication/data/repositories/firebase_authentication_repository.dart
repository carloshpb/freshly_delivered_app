import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/exceptions/app_exception.dart';

import 'package:multiple_result/src/result.dart';

import '../../domain/repositories/authentication_repository.dart';

final firebaseAuthenticationRepositoryProvider =
    Provider<FirebaseAuthenticationRepository>(
  (ref) {
    return FirebaseAuthenticationRepository();
  },
  name: r"firebaseAuthenticationRepositoryProvider",
);

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  @override
  Future<Result<void, AppException>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<void, AppException>> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Result<void, AppException>> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
