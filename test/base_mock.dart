import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshly_delivered_app/features/authentication/application/dtos/onboarding_message_dto.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/repositories/onboarding_messages_repository.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/add_onboarding_message_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/current_user_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/get_onboarding_messages_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/send_password_reset_email_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/set_onboarding_messages_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/sign_in_email_password_use_case.dart';
import 'package:freshly_delivered_app/features/authentication/domain/use_cases/sign_up_email_password_use_case.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([
  MockSpec<Listener>(),
  MockSpec<OnboardingMessageDTO>(),
  MockSpec<AuthenticationRepository>(),
  MockSpec<OnboardingMessagesRepository>(),
  MockSpec<SetOnboardingMessagesUseCase>(),
  MockSpec<SendPasswordResetEmailUseCase>(),
  MockSpec<SignInEmailPasswordUseCase>(),
  MockSpec<SignUpEmailPasswordUseCase>(),
  MockSpec<GetOnboardingMessagesUseCase>(),
  MockSpec<CurrentUserUseCase>(),
  MockSpec<AddOnboardingMessageUseCase>(),
  MockSpec<UserCredential>(),
  MockSpec<FirebaseAuth>(),
  MockSpec<User>(),
  MockSpec<SharedPreferences>(),
  MockSpec<GoRouter>(),
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
// import 'base_mock.mocks.dart';

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
