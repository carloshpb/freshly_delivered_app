class Strings {
  /// Words
  static const login = "Login";
  static const email = "Email";
  static const password = "Password";
  static const recover = "Recover";
  static const next = "Next";
  static const back = "Back";
  static const skip = "Skip";
  static const register = "Register";

  /// Messages
  static const forgotPasword = "Forgot password?";
  static const getStarted = "Get started";
  static const questionDontHaveAccount = "Don’t have an account?";

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

  // Firebase Auth
  static const invalidEmail = "The email address is not valid";
  static const missingAndroidPkgName = "The email address is not valid.";
  static const missingContinueUri = "The email address is not valid.";
  static const missingIosBundleId = "The email address is not valid.";
  static const invalidContinueUri = "The email address is not valid.";
  static const unauthorizedContinueUri = "The email address is not valid.";
  static const userNotFound = "The email address is not valid.";
  static const unknownErrorCode =
      "This exception code is unknown. Please contact the company to report this error";
  static const userDisabled = "";
  static const wrongPassword = "";
  static const emailAlreadyInUseException = "";
  static const operationNotAllowedException = "";
  static const weakPassword = "The password must be 6 characters long or more";
}
