class Strings {
  /// Words
  static const login = "Login";
  static const email = "Email";
  static const fullname = "Fullname";
  static const phoneNumber = "Phone Number";
  static const password = "Password";
  static const confirmPassword = "Confirm Password";
  static const recover = "Recover";
  static const next = "Next";
  static const back = "Back";
  static const skip = "Skip";
  static const register = "Register";
  static const recoverAccount = "Recover Account";
  static const resetLinkSent = "Reset Link Sent";
  static const here = "Here";
  static const resend = "Resend";
  static const success = "Success";
  static const home = "Home";
  static const wishlist = "Wishlist";
  static const cart = "Cart";
  static const settings = "Settings";
  static const popular = "Popular";

  /// Messages
  static const forgotPasword = "Forgot password?";
  static const resetMyAccount = "Reset my Account";
  static const sampleEmail = "johndoe@example.com";
  static const sampleFullname = "John Doe";
  static const samplePhoneNumber = "+234 803 5124 789";
  static const choosePassword = "Choose a Password";
  static const getStarted = "Get started";
  static const questionDontHaveAccount = "Don’t have an account?";
  static const questionNoResetPassSentLink = "Didn’t receive the reset link?";
  static const questionAlreadyHaveAccount = "Already have an account?";
  static const recoverPassMessage =
      "Enter the email address connected to your account and we will send you a link to reset your password";
  static const sentResetLinkMessage =
      "We have sent a link to the email provided. Please click on the link to reset your account. Please check your spam folder if you did not see it in your inbox";
  static const sentNewResetLinkMail = "New link sent to your email";
  static const createAccountWarning =
      "By creating an account, you agree to be bound by our Terms of Service and Privacy Policy";
  static const insertValidEmail = "Invalid email. Please insert a valid one";
  static const insertValidPhone =
      "Invalid phone number. Please insert a valid one";
  static const emailAlreadyUsed = "Email address already in use";
  static const passwordsNotMatch = "Passwords don\'t match";
  static const accountCreatedSuccess =
      "Account created successfully. Please wait while we log you into your account.";
  static const searchProductsHint = "Search recipes, groceries and more";
  static const moreAdvertisementsSoon = "More advertisements soon!";
  static const addToCard = "Add to card";
  static const advertisementsNotFound = "No advertisement was found for now.";
  static const productsNotFound = "No product was found.";
  static const tryAgainLater = "Try again later.";

  /// SQLite tables
  static const sqlite = "SQLite";
  static const appUserLocalTable = "connected_user";
  static const productsLocalTable = "products";
  static const advertisementsLocalTable = "advertisements";
  static const userCartLocalTable = "user_cart";
  static const discountLocalTable = "discounts";

  /// Firestore tables
  static const firestore = "Firestore";
  static const appUserRemoteTable = "user_personal_data";
  static const productsRemoteTable = "products";
  static const advertisementsRemoteTable = "advertisements";
  static const userCartRemoteTable = "carts";
  static const discountRemoteTable = "discounts";
  static const onboardingMessagesRemoteTable = "onboarding_messages";

  /// Exceptions
  /// General
  static const serverOff =
      "The server is unreachable at the moment. Try again later";
  static const internetOff =
      "You are not connected to the internet at the moment";
  static const wrongFormat = "Wrong format";

  // Authentication
  static const incompleteVerificationCode =
      "The verification code is incomplete";
  static const userNotSignedIn =
      "The operation can't be completed (not signed in)";
  static const invalidEmailOrPasswordSignIn =
      "The email or password does not match";
  static const userNotConnected = "No account is logged in at the moment";

  // Firebase Auth
  static const invalidEmail = "The email address is not valid";
  static const invalidPhoneNumber = "The phone number is not valid";
  static const missingAndroidPkgName =
      "A package name must be provided to install the Android app";
  static const missingContinueUri =
      "The next URL must be provided in the request";
  static const missingIosBundleId =
      "A bundle name must be provided to install the iOS app";
  static const invalidContinueUri =
      "The next URL provided in the request is invalid";
  static const unauthorizedContinueUri =
      "The domain of the next URL is not whitelisted";
  static const userNotFound = "The user does not match any credentials";
  static const unknownErrorCode =
      "This exception code is unknown. Please contact the company to report this error";
  static const userDisabled =
      "The user corresponding to the given credential has been disabled";
  static const wrongPassword = "Wrong password";
  static const emailAlreadyInUseException =
      "The provided email is already in use";
  static const operationNotAllowedException =
      "The account type corresponding to this credential is not yet activated";
  static const weakPassword = "The password must be 8 characters long or more";
  static const expiredActionCode = "The action code or link has expired";
  static const invalidActionCode =
      "The action code is invalid. This can happen if the code is malformed or has already been used";

  // Onboarding Messages
  static const imageSvgPathOnboarding1 = 'assets/images/onboarding1.svg.vec';
  static const titleOnboarding1 = 'SHOP CONVENIENTLY';
  static const messageOnboarding1 =
      'Shop from an unlimited stock of groceries from the convenience of your homes';

  static const imageSvgPathOnboarding2 = 'assets/images/onboarding2.svg.vec';
  static const titleOnboarding2 = 'EXPERTLY CURATED RECIPES';
  static const messageOnboarding2 =
      'Our recipes are prepared in the finest of conditions by experts in their fields';

  static const imageSvgPathOnboarding3 = 'assets/images/onboarding3.svg.vec';
  static const titleOnboarding3 = 'BRING OUT THE CHEF IN YOU';
  static const messageOnboarding3 =
      'Our recipes are specially picked so you can get cooking in no time';
}
