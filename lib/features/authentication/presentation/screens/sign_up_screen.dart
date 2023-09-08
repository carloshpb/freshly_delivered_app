import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../common_widgets/custom_snackbar.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../../routers/app_router.dart';
import '../controllers/sign_up_controller.dart';

final _columnHeightProvider = StateProvider.autoDispose<double>(
  (ref) {
    var numberErrorFields = ref.watch(_numberErrorFieldsProvider);
    if (numberErrorFields == 0) {
      return 785.0;
    } else if (numberErrorFields == 1) {
      return 805.0;
    } else if (numberErrorFields == 2) {
      return 825.0;
    } else if (numberErrorFields == 3) {
      return 845.0;
    } else {
      return 865.0;
    }
  },
);

final _numberErrorFieldsProvider = StateProvider.autoDispose<int>(
  (ref) {
    var count = 0;
    if (ref.watch(_validEmailProvider) == false) {
      count++;
    }
    if (ref.watch(_validPhoneProvider) == false) {
      count++;
    }
    if (ref.watch(_validPasswordProvider) == false) {
      count++;
    }
    if (ref.watch(_validConfirmPasswordProvider) == false) {
      count++;
    }

    return count;
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

final _textEmailFieldProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final _textFullnameFieldProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final _textPhoneFieldProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final _textPasswordFieldProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

final _textConfirmPasswordFieldProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // final _phoneRegex = RegExp(r"^\+[0-9]{1,3}\.[0-9]{4,14}(?:x.+)?$");
  final _phoneRegex = RegExp(r"^\+[1-9]\d{1,14}$");

  final _emailFocusNode = FocusNode();
  final _fullnameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  final _emailFieldKey = GlobalKey();
  final _fullNameFieldKey = GlobalKey();
  final _phoneFieldKey = GlobalKey();
  final _passwordFieldKey = GlobalKey();
  final _confirmPasswordFieldKey = GlobalKey();

  void addScrollableTextFieldListener(
      FocusNode textFieldFocusNode, BuildContext context) {
    textFieldFocusNode.addListener(() {
      if (textFieldFocusNode.hasFocus) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      addScrollableTextFieldListener(
          _emailFocusNode, _emailFieldKey.currentContext!);
      addScrollableTextFieldListener(
          _fullnameFocusNode, _fullNameFieldKey.currentContext!);
      addScrollableTextFieldListener(
          _phoneFocusNode, _phoneFieldKey.currentContext!);
      addScrollableTextFieldListener(
          _passwordFocusNode, _passwordFieldKey.currentContext!);
      addScrollableTextFieldListener(
          _confirmPasswordFocusNode, _confirmPasswordFieldKey.currentContext!);
    });
  }

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _fullnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);
    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
      leading: (state.value!)
          ? null
          : BackButton(
              color: Colors.white,
              onPressed: () {
                if (!ref.watch(signUpControllerProvider).value!) {
                  context.go(AppRouter.login.path);
                }
              },
            ),
    );

    final textEmail = ref.watch(_textEmailFieldProvider);
    final textFullname = ref.watch(_textFullnameFieldProvider);
    final textPhone = ref.watch(_textPhoneFieldProvider);
    final textPassword = ref.watch(_textPasswordFieldProvider);
    final textConfirmPassword = ref.watch(_textConfirmPasswordFieldProvider);

    // error handling
    ref.listen<AsyncValue<bool>>(
      signUpControllerProvider,
      (previousState, nextState) {
        print("LISTENER DO SIGN UP ; INICIO");
        if (context.loaderOverlay.visible) {
          print("ESCONDENDO OVERLAY");
          context.loaderOverlay.hide();
        }
        nextState.when(
          data: (isRegistered) {
            print("OPA TEM DATA ! : $isRegistered");
            if (isRegistered) {
              context.go(
                  "${AppRouter.login.path}/${AppRouter.signUp.path}/${AppRouter.successSignUp.path}");
            }
          },
          loading: () {
            print("LISTENER LOADING ....");
            context.loaderOverlay.show();
          },
          error: (error, stackTrace) {
            print("LISTENER DEU RUIM!!!");
            if (error is EmailAlreadyInUseException ||
                error is InvalidEmailException) {
              _emailFocusNode.requestFocus();
              ref.watch(_validEmailProvider.notifier).state = false;
            } else {
              CustomSnackbar.showErrorToast(context, 'Error', error.toString());
            }
          },
        );
      },
    );

    return WillPopScope(
      onWillPop: () async => !(state.value!),
      child: Scaffold(
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
                      //maxHeight: constraints.maxHeight,
                    ),
                    child: SizedBox(
                      height: ref.watch(_columnHeightProvider),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                  child: TextFormField(
                                    key: _emailFieldKey,
                                    autofillHints: const [AutofillHints.email],
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _emailFocusNode,
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    onChanged: (email) {
                                      ref
                                          .watch(
                                              _textEmailFieldProvider.notifier)
                                          .state = email;
                                      if (state.hasError &&
                                          (state.error
                                                  is EmailAlreadyInUseException ||
                                              state.error
                                                  is InvalidEmailException)) {
                                        ref
                                            .watch(signUpControllerProvider
                                                .notifier)
                                            .clearState();
                                      }
                                      if (email.isEmpty ||
                                          EmailValidator.validate(email)) {
                                        if (!ref.watch(_validEmailProvider)) {
                                          ref
                                              .watch(
                                                  _validEmailProvider.notifier)
                                              .state = true;
                                        }
                                        return;
                                      }
                                      if (ref.watch(_validEmailProvider)) {
                                        ref
                                            .watch(_validEmailProvider.notifier)
                                            .state = false;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: Strings.sampleEmail,
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      errorText: (state.hasError &&
                                              (state.error
                                                      is EmailAlreadyInUseException ||
                                                  state.error
                                                      is InvalidEmailException))
                                          ? (state.error as Exception)
                                              .toString()
                                          : (ref.watch(_validEmailProvider))
                                              ? null
                                              : Strings.insertValidEmail,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
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
                                  child: TextFormField(
                                    key: _fullNameFieldKey,
                                    autofillHints: const [AutofillHints.name],
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _fullnameFocusNode,
                                    onChanged: (fullname) {
                                      ref
                                          .watch(_textFullnameFieldProvider
                                              .notifier)
                                          .state = fullname;
                                    },
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
                                  child: TextFormField(
                                    key: _phoneFieldKey,
                                    autofillHints: const [
                                      AutofillHints.telephoneNumber
                                    ],
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _phoneFocusNode,
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    onChanged: (phone) {
                                      ref
                                          .watch(
                                              _textPhoneFieldProvider.notifier)
                                          .state = phone;
                                      if (phone.isEmpty ||
                                          _phoneRegex.hasMatch(phone)) {
                                        if (!ref.watch(_validPhoneProvider)) {
                                          ref
                                              .watch(
                                                  _validPhoneProvider.notifier)
                                              .state = true;
                                        }
                                        return;
                                      }
                                      if (ref.watch(_validPhoneProvider)) {
                                        ref
                                            .watch(_validPhoneProvider.notifier)
                                            .state = false;
                                      }
                                    },
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
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
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
                                  child: TextFormField(
                                    key: _passwordFieldKey,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.next,
                                    focusNode: _passwordFocusNode,
                                    onChanged: (password) {
                                      ref
                                          .watch(_textPasswordFieldProvider
                                              .notifier)
                                          .state = password;
                                      if (password.isNotEmpty) {
                                        if (password.length < 8) {
                                          if (ref
                                              .watch(_validPasswordProvider)) {
                                            ref
                                                .watch(_validPasswordProvider
                                                    .notifier)
                                                .state = false;
                                          }
                                          return;
                                        } else if (textConfirmPassword
                                                .isNotEmpty &&
                                            textConfirmPassword != password) {
                                          if (ref
                                              .watch(_validPasswordProvider)) {
                                            ref
                                                .watch(_validPasswordProvider
                                                    .notifier)
                                                .state = false;
                                            return;
                                          }
                                          return;
                                        }
                                      }
                                      if (!ref.watch(_validPasswordProvider)) {
                                        ref
                                            .watch(
                                                _validPasswordProvider.notifier)
                                            .state = true;
                                      }
                                    },
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
                                              textPassword.length < 8)
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
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
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
                                  child: TextFormField(
                                    key: _confirmPasswordFieldKey,
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    focusNode: _confirmPasswordFocusNode,
                                    onChanged: (confirmPassword) {
                                      ref
                                          .watch(
                                              _textConfirmPasswordFieldProvider
                                                  .notifier)
                                          .state = confirmPassword;
                                      if (confirmPassword.isNotEmpty) {
                                        if (textPassword.isNotEmpty &&
                                            textPassword != confirmPassword) {
                                          if (ref.watch(
                                              _validConfirmPasswordProvider)) {
                                            ref
                                                .watch(
                                                    _validConfirmPasswordProvider
                                                        .notifier)
                                                .state = false;
                                          }
                                          return;
                                        }
                                      }
                                      if (!ref.watch(
                                          _validConfirmPasswordProvider)) {
                                        ref
                                            .watch(_validConfirmPasswordProvider
                                                .notifier)
                                            .state = true;
                                      }
                                    },
                                    onEditingComplete: () async {
                                      if (!state.hasError &&
                                          textEmail.isNotEmpty &&
                                          textFullname.isNotEmpty &&
                                          textPhone.isNotEmpty &&
                                          textPassword.isNotEmpty &&
                                          textConfirmPassword.isNotEmpty &&
                                          ref.watch(
                                                  _numberErrorFieldsProvider) ==
                                              0) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        await ref
                                            .watch(signUpControllerProvider
                                                .notifier)
                                            .register(
                                              email: textEmail,
                                              fullName: textFullname,
                                              phoneNumber: textPhone,
                                              password: textPassword,
                                            );
                                      }
                                    },
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
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 9.0),
                                  child: ElevatedButton(
                                    onPressed: (state.hasError ||
                                            textEmail.isEmpty ||
                                            textFullname.isEmpty ||
                                            textPhone.isEmpty ||
                                            textPassword.isEmpty ||
                                            textConfirmPassword.isEmpty ||
                                            ref.watch(
                                                    _numberErrorFieldsProvider) !=
                                                0)
                                        ? null
                                        : () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            ref
                                                .watch(signUpControllerProvider
                                                    .notifier)
                                                .register(
                                                  email: textEmail,
                                                  fullName: textFullname,
                                                  phoneNumber: textPhone,
                                                  password: textPassword,
                                                );
                                          },
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
                                          .watch(goRouterProvider)
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
      ),
    );
  }
}

// class SuccessSignUp extends StatelessWidget {
//   const SuccessSignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         const Text(
//           Strings.success,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 40.0,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         Image.asset('assets/images/confirm_ball.png'),
//         const Center(
//           child: SizedBox(
//             width: 302.0,
//             height: 72.0,
//             child: Text(
//               Strings.accountCreatedSuccess,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//         ),
//         const Center(
//           child: CircularProgressIndicator(
//             backgroundColor: Colors.white,
//             color: Color.fromRGBO(23, 104, 46, 1.0),
//           ),
//         ),
//       ],
//     );
//   }
// }
