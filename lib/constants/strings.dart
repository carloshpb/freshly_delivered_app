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
  static const recoverAccount = "Recover Account";
  static const resetLinkSent = "Reset Link Sent";
  static const here = "Here";

  /// Messages
  static const forgotPasword = "Forgot password?";
  static const getStarted = "Get started";
  static const questionDontHaveAccount = "Don’t have an account?";
  static const questionNoResetPassSentLink = "Didn’t receive the reset link?";
  static const questionAlreadyHaveAccount = "Already have an account?";
  static const recoverPassMessage =
      "Enter the email address connected to your account and we will send you a link to reset your password";
  static const sentResetLinkMessage =
      "We have sent a link to the email provided. Please click on the link to reset your account. Please check your spam folder if you did not see it in your inbox";

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
  static const weakPassword = "The password must be 6 characters long or more";
  static const expiredActionCode = "The action code or link has expired";
  static const invalidActionCode =
      "The action code is invalid. This can happen if the code is malformed or has already been used";
}
