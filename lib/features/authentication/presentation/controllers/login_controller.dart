import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../application/use_cases/sign_in_use_case_impl.dart';

final loginControllerProvider =
    NotifierProvider.autoDispose<LoginController, void>(
  () => LoginController(),
  name: r'loginControllerProvider',
);

class LoginController extends AutoDisposeNotifier<void> {
  @override
  void build() {
    // TODO: implement build
  }

  void signIn(String email, String password) {
    ref.read(signInUseCaseProvider).execute(request: (email, password));
  }
}
