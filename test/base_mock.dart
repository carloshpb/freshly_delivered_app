import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<Listener>(),
  MockSpec<AuthenticationRepository>(),
  MockSpec<UserCredential>(),
  MockSpec<FirebaseAuth>(),
  MockSpec<User>(),
  // MockSpec<CountryManager>(),
  // MockSpec<CountryWithPhoneCode>(),
  // MockSpec<FormatPhoneResult>(),
  // MockSpec<LibPhonenumberTextFormatter>(),
  // MockSpec<CountryPhoneMapper>(),
  // MockSpec<PhoneNumberMapper>(),
  // MockSpec<CountryPhone>(),
  // MockSpec<PhoneNumber>(),
  // MockSpec<IntlPhoneMobileRepository>(),
  // MockSpec<CountryFlagRepository>(),
  //MockSpec<PhoneCountryService>(),
])
import 'base_mock.mocks.dart';

// class FakeAppLocalizations extends Fake implements AppLocalizations {
//   @override
//   String country_not_found(String invalidCode) {
//     return "Country code ($invalidCode) was not recognized";
//   }

//   @override
//   String get invalid_phone_number {
//     return "The phone number is in an invalid format (E.164 standard).";
//   }
// }

// class FakeFlutterLibphonenumber extends Mock implements FlutterLibphonenumber {}

// class FakeCountryManager extends Mock implements CountryManager {}

// class MockUserCredential extends Mock implements UserCredential {}

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// class MockUser extends Mock implements User {}

abstract class Listener<T> {
  void call(T? previous, T next);
}
