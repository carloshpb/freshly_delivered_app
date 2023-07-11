import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/ensure_visible_when_focused.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../../routers/app_router.dart';
import '../controllers/sign_up_controller.dart';

final _columnHeightProvider = StateProvider.autoDispose<double>(
  (ref) {
    var validFields = ref.watch(_validFieldsProvider);
    // if (validFields) {
    //   return 707.0;
    // }
    // return 795.0;
    // if (validFields) {
    //   return 900.0;
    // }
    // return 1000.0;
    // if (validFields) {
    //   return 0.14;
    // }
    // return 0.10;
    if (validFields) {
      return 785.0;
    }
    return 860.0;
  },
);

final _validFieldsProvider = StateProvider.autoDispose<bool>(
  (ref) {
    var validEmail = ref.watch(_validEmailProvider);
    var validPhone = ref.watch(_validPhoneProvider);
    var validPassword = ref.watch(_validPasswordProvider);
    var validConfirmPassword = ref.watch(_validConfirmPasswordProvider);
    if (validEmail && validPhone && validPassword && validConfirmPassword) {
      return true;
    }
    return false;
  },
);

final _validEmailProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

final _validPhoneProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

final _validPasswordProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

final _validConfirmPasswordProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneRegex = RegExp(r"^\+[0-9]{1,3}\.[0-9]{4,14}(?:x.+)?$");
  final emailFocusNode = FocusNode();
  final fullnameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final _formEmailKey = GlobalKey<FormFieldState>();
  final _formFullNameKey = GlobalKey<FormFieldState>();
  final _formPhoneNumberKey = GlobalKey<FormFieldState>();
  final _formPasswordKey = GlobalKey<FormFieldState>();
  final _formConfirmPasswordKey = GlobalKey<FormFieldState>();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
      leading: BackButton(
        onPressed: () => ref.read(goRouterProvider).go(AppRouter.login.path),
      ),
    );
    final state = ref.watch(signUpControllerProvider);
    return Scaffold(
      backgroundColor: CustomColors.mainGreen,
      appBar: appBar,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: SizedBox(
                    height: ref.watch(_columnHeightProvider),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Consumer(
                        //   builder: (context, boxRef, child) {
                        //     return SizedBox(
                        //       height: 0.10 * 850.0,
                        //       child: child,
                        //     );
                        //   },
                        //   child: Center(
                        //     child: Text(
                        //       Strings.register.toUpperCase(),
                        //       textAlign: TextAlign.center,
                        //       style: const TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 40.0,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Flexible(
                          child: Center(
                            child: Text(
                              Strings.register.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 600.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text(
                                  "${Strings.email.toUpperCase()}:",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: EnsureVisibleWhenFocused(
                                  focusNode: emailFocusNode,
                                  child: TextFormField(
                                    key: _formEmailKey,
                                    // autovalidateMode:
                                    //     AutovalidateMode.onUserInteraction,
                                    autofillHints: const [AutofillHints.email],
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: emailFocusNode,
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    onChanged: (email) {
                                      if (email.isEmpty ||
                                          EmailValidator.validate(email)) {
                                        if (!ref.read(_validEmailProvider)) {
                                          ref
                                              .read(
                                                  _validEmailProvider.notifier)
                                              .state = true;
                                        }
                                        return;
                                      }
                                      if (ref.read(_validEmailProvider)) {
                                        ref
                                            .read(_validEmailProvider.notifier)
                                            .state = false;
                                      }
                                    },
                                    // validator: (String? email) {
                                    //   if (email == null ||
                                    //       EmailValidator.validate(email)) {
                                    //     if (!ref.read(_validEmailProvider)) {
                                    //       ref
                                    //           .read(
                                    //               _validEmailProvider.notifier)
                                    //           .state = true;
                                    //     }
                                    //     return null;
                                    //   }
                                    //   if (ref.read(_validEmailProvider)) {
                                    //     ref
                                    //         .read(_validEmailProvider.notifier)
                                    //         .state = false;
                                    //   }
                                    //   return Strings.insertValidEmail;
                                    // },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: Strings.sampleEmail,
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      errorText: (ref
                                                  .watch(
                                                      signUpControllerProvider)
                                                  .hasError &&
                                              ref
                                                      .watch(
                                                          signUpControllerProvider)
                                                      .error
                                                  is UserNotFoundException)
                                          ? (ref
                                                  .watch(
                                                      signUpControllerProvider)
                                                  .error as UserNotFoundException)
                                              .message
                                          : (ref.watch(_validEmailProvider))
                                              ? null
                                              : Strings.insertValidEmail,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text(
                                  "${Strings.fullname.toUpperCase()}:",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: EnsureVisibleWhenFocused(
                                  focusNode: fullnameFocusNode,
                                  child: TextFormField(
                                    key: _formFullNameKey,
                                    autofillHints: const [AutofillHints.name],
                                    controller: _fullNameController,
                                    keyboardType: TextInputType.text,
                                    focusNode: fullnameFocusNode,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(256),
                                    ],
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: Strings.sampleFullname,
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text(
                                  "${Strings.phoneNumber.toUpperCase()}:",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: EnsureVisibleWhenFocused(
                                  focusNode: phoneFocusNode,
                                  child: TextFormField(
                                    key: _formPhoneNumberKey,
                                    autofillHints: const [
                                      AutofillHints.telephoneNumber
                                    ],
                                    controller: _phoneController,
                                    keyboardType: TextInputType.phone,
                                    focusNode: phoneFocusNode,
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    onChanged: (phone) {
                                      if (phone.isEmpty ||
                                          _phoneRegex.hasMatch(phone)) {
                                        if (!ref.read(_validPhoneProvider)) {
                                          ref
                                              .read(
                                                  _validPhoneProvider.notifier)
                                              .state = true;
                                        }
                                        return;
                                      }
                                      if (ref.read(_validPhoneProvider)) {
                                        ref
                                            .read(_validPhoneProvider.notifier)
                                            .state = false;
                                      }
                                    },
                                    // validator: (phone) {
                                    //   if (phone == null ||
                                    //       _phoneRegex.hasMatch(phone)) {
                                    //     if (!ref.read(_validPhoneProvider)) {
                                    //       ref
                                    //           .read(
                                    //               _validPhoneProvider.notifier)
                                    //           .state = true;
                                    //     }
                                    //     return null;
                                    //   }
                                    //   if (ref.read(_validPhoneProvider)) {
                                    //     ref
                                    //         .read(_validPhoneProvider.notifier)
                                    //         .state = false;
                                    //   }
                                    //   return Strings.insertValidPhone;
                                    // },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: Strings.samplePhoneNumber,
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      errorText:
                                          (ref.watch(_validPhoneProvider))
                                              ? null
                                              : Strings.insertValidPhone,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text(
                                  "${Strings.password.toUpperCase()}:",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: EnsureVisibleWhenFocused(
                                  focusNode: passwordFocusNode,
                                  child: TextFormField(
                                    key: _formPasswordKey,
                                    obscureText: true,
                                    // autovalidateMode:
                                    //     AutovalidateMode.onUserInteraction,
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    focusNode: passwordFocusNode,
                                    onChanged: (password) {
                                      if (password.isNotEmpty) {
                                        if (password.length < 8) {
                                          if (ref
                                              .read(_validPasswordProvider)) {
                                            ref
                                                .read(_validPasswordProvider
                                                    .notifier)
                                                .state = false;
                                          }
                                          return;
                                        } else if (_confirmPasswordController
                                                .text.isNotEmpty &&
                                            _confirmPasswordController.text !=
                                                password) {
                                          if (ref
                                              .read(_validPasswordProvider)) {
                                            ref
                                                .read(_validPasswordProvider
                                                    .notifier)
                                                .state = false;
                                            return;
                                          }
                                          return;
                                        }
                                      }
                                      if (!ref.read(_validPasswordProvider)) {
                                        ref
                                            .read(
                                                _validPasswordProvider.notifier)
                                            .state = true;
                                      }
                                    },
                                    // validator: (password) {
                                    //   if (password != null) {
                                    //     if (password.length < 8) {
                                    //       if (ref
                                    //           .read(_validPasswordProvider)) {
                                    //         ref
                                    //             .read(_validPasswordProvider
                                    //                 .notifier)
                                    //             .state = false;
                                    //       }
                                    //       return Strings.weakPassword;
                                    //     } else if (_confirmPasswordController
                                    //             .text.isNotEmpty &&
                                    //         _confirmPasswordController.text !=
                                    //             password) {
                                    //       if (ref
                                    //           .read(_validPasswordProvider)) {
                                    //         ref
                                    //             .read(_validPasswordProvider
                                    //                 .notifier)
                                    //             .state = false;
                                    //       }
                                    //       return Strings.passwordsNotMatch;
                                    //     }
                                    //   }
                                    //   if (!ref.read(_validPasswordProvider)) {
                                    //     ref
                                    //         .read(
                                    //             _validPasswordProvider.notifier)
                                    //         .state = true;
                                    //   }
                                    //   return null;
                                    // },
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText:
                                          Strings.choosePassword.toLowerCase(),
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      errorText: (!ref.watch(
                                                  _validPasswordProvider) &&
                                              _passwordController.text.length <
                                                  8)
                                          ? Strings.weakPassword
                                          : (!ref.watch(
                                                      _validPasswordProvider) &&
                                                  !ref.watch(
                                                      _validConfirmPasswordProvider))
                                              ? Strings.passwordsNotMatch
                                              : null,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text(
                                  "${Strings.confirmPassword.toUpperCase()}:",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: EnsureVisibleWhenFocused(
                                  focusNode: confirmPasswordFocusNode,
                                  child: TextFormField(
                                    key: _formConfirmPasswordKey,
                                    obscureText: true,
                                    controller: _confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    focusNode: confirmPasswordFocusNode,
                                    onChanged: (confirmPassword) {
                                      if (confirmPassword.isNotEmpty) {
                                        if (_passwordController
                                                .text.isNotEmpty &&
                                            _passwordController.text !=
                                                confirmPassword) {
                                          if (ref.read(
                                              _validConfirmPasswordProvider)) {
                                            ref
                                                .read(
                                                    _validConfirmPasswordProvider
                                                        .notifier)
                                                .state = false;
                                          }
                                          return;
                                        }
                                      }
                                      if (!ref.read(
                                          _validConfirmPasswordProvider)) {
                                        ref
                                            .read(_validConfirmPasswordProvider
                                                .notifier)
                                            .state = true;
                                      }
                                    },
                                    // validator: (confirmPassword) {
                                    //   if (confirmPassword != null &&
                                    //       _passwordController.text.isNotEmpty &&
                                    //       _passwordController.text !=
                                    //           confirmPassword) {
                                    //     if (ref.read(
                                    //         _validConfirmPasswordProvider)) {
                                    //       ref
                                    //           .read(
                                    //               _validConfirmPasswordProvider
                                    //                   .notifier)
                                    //           .state = false;
                                    //     }
                                    //     return Strings.passwordsNotMatch;
                                    //   }
                                    //   if (!ref.read(
                                    //       _validConfirmPasswordProvider)) {
                                    //     ref
                                    //         .read(_validConfirmPasswordProvider
                                    //             .notifier)
                                    //         .state = true;
                                    //   }
                                    //   return null;
                                    // },
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText:
                                          Strings.confirmPassword.toLowerCase(),
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      errorText: (!ref.watch(
                                              _validConfirmPasswordProvider))
                                          ? Strings.passwordsNotMatch
                                          : null,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 9.0),
                                child: ElevatedButton(
                                  onPressed: (ref
                                              .watch(signUpControllerProvider)
                                              .hasError &&
                                          (ref
                                                      .watch(
                                                          signUpControllerProvider)
                                                      .error
                                                  is WrongPasswordException ||
                                              ref
                                                      .watch(
                                                          signUpControllerProvider)
                                                      .error
                                                  is UserNotFoundException))
                                      ? null
                                      : () => ref
                                          .read(
                                              signUpControllerProvider.notifier)
                                          .register(
                                            email: _emailController.text,
                                            fullName: _fullNameController.text,
                                            phoneNumber: _phoneController.text,
                                            password: _passwordController.text,
                                          ),
                                  child: Text(
                                    Strings.register.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                Strings.createAccountWarning.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    Strings.questionAlreadyHaveAccount,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => ref
                                        .read(goRouterProvider)
                                        .go(AppRouter.login.path),
                                    child: Text(
                                      "${Strings.login} ${Strings.here}"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
