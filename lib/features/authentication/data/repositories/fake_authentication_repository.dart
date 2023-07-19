import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../../utils/delay.dart';
import '../../../../utils/in_memory_store.dart';
import '../../domain/models/app_user.dart';
import '../../domain/repositories/authentication_repository.dart';

class FakeAuthenticationRepository implements AuthenticationRepository {
  FakeAuthenticationRepository({this.addDelay = true});
  final bool addDelay;
  final _authState = InMemoryStore<AppUser?>(null);

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  // List to keep track of all user accounts
  final List<FakeAppUser> _users = [
    FakeAppUser(
      uid: Strings.sampleEmail.split('').reversed.join(),
      email: Strings.sampleEmail,
      fullname: Strings.sampleFullname,
      password: "12345678",
      phoneNumber: Strings.samplePhoneNumber,
    ),
  ];
  final Map<String, String> _resetCode = {};

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    // check the given credentials agains each registered user
    for (final u in _users) {
      // matching email and password
      if (u.email == email && u.password == password) {
        _authState.value = u;
        return;
      }
      // same email, wrong password
      if (u.email == email && u.password != password) {
        throw const WrongPasswordException();
      }
    }
    throw const UserNotFoundException();
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password,
      String fullName, String phoneNumber) async {
    await delay(addDelay);
    // check if the email is already in use
    for (final u in _users) {
      if (u.email == email) {
        throw const EmailAlreadyInUseException();
      }
    }
    // minimum password length requirement
    if (password.length < 8) {
      throw const WeakPasswordException();
    }
    // create new user
    _createNewUser(email, password, fullName, phoneNumber);
  }

  @override
  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();

  void _createNewUser(
      String email, String password, String fullName, String phoneNumber) {
    // create new user
    final user = FakeAppUser(
      uid: email.split('').reversed.join(),
      email: email,
      password: password,
      fullname: fullName,
      phoneNumber: phoneNumber,
    );
    // register it
    _users.add(user);
    // update the auth state
    _authState.value = user;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await delay(addDelay);

    for (final u in _users) {
      if (u.email == email) {
        _resetCode[email] = "123456";
        return;
      }
    }

    throw const UserNotFoundException();
  }
}
