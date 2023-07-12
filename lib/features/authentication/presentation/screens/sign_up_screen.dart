import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../common_widgets/custom_snackbar.dart';
import '../../../../common_widgets/ensure_visible_when_focused.dart';
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
      return 860.0;
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
  // final _phoneRegex = RegExp(r"^\+[0-9]{1,3}\.[0-9]{4,14}(?:x.+)?$");
  final _phoneRegex = RegExp(r"^\+[1-9]\d{1,14}$");
  final emailFocusNode = FocusNode();
  final fullnameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

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
    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
      leading: BackButton(
        color: Colors.white,
        onPressed: () => ref.read(goRouterProvider).go(AppRouter.login.path),
      ),
    );

    // error handling
    ref.listen<AsyncValue<void>>(
      signUpControllerProvider,
      (previousState, nextState) => nextState.whenOrNull(
        error: (error, stackTrace) {
          if (error is EmailAlreadyInUseException) {
            ref.read(_validEmailProvider.notifier).state = false;
          } else {
            CustomSnackbar.showErrorToast(context, 'Erro', error.toString());
          }
        },
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
                                    autofillHints: const [AutofillHints.email],
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: emailFocusNode,
                                    style: const TextStyle(
                                      color: CustomColors.buttonGreen,
                                      fontSize: 16.0,
                                    ),
                                    onChanged: (email) {
                                      if (state.hasError &&
                                          state.error
                                              is EmailAlreadyInUseException) {
                                        ref
                                            .read(signUpControllerProvider
                                                .notifier)
                                            .clearState();
                                      }
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
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: Strings.sampleEmail,
                                      hintStyle: const TextStyle(
                                        color: Colors.black45,
                                      ),
                                      errorText: (state.hasError &&
                                              state.error
                                                  is EmailAlreadyInUseException)
                                          ? (state.error
                                                  as EmailAlreadyInUseException)
                                              .message
                                          : (ref.watch(_validEmailProvider))
                                              ? null
                                              : Strings.insertValidEmail,
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //     10.0,
                                      //   ),
                                      //   borderSide:
                                      //       (ref.watch(_validEmailProvider))
                                      //           ? BorderSide.none
                                      //           : const BorderSide(
                                      //               color: Colors.red,
                                      //               width: 2.0,
                                      //               style: BorderStyle.solid,
                                      //             ),
                                      // ),
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
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //     10.0,
                                      //   ),
                                      //   borderSide:
                                      //       (ref.watch(_validPhoneProvider))
                                      //           ? BorderSide.none
                                      //           : const BorderSide(
                                      //               color: Colors.red,
                                      //               width: 2.0,
                                      //               style: BorderStyle.solid,
                                      //             ),
                                      // ),
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
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //     10.0,
                                      //   ),
                                      //   borderSide: (ref.watch(
                                      //           _validPasswordProvider))
                                      //       ? BorderSide.none
                                      //       : const BorderSide(
                                      //           color: Colors.red,
                                      //           width: 2.0,
                                      //           style: BorderStyle.solid,
                                      //         ),
                                      // ),
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
                                    obscureText: true,
                                    controller: _confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
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
                                    onEditingComplete: () async {
                                      if (!state.hasError &&
                                          _emailController.text.isNotEmpty &&
                                          _fullNameController.text.isNotEmpty &&
                                          _phoneController.text.isNotEmpty &&
                                          _passwordController.text.isNotEmpty &&
                                          _confirmPasswordController
                                              .text.isNotEmpty &&
                                          ref.watch(
                                                  _numberErrorFieldsProvider) ==
                                              0) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        context.loaderOverlay.show();
                                        await ref
                                            .read(signUpControllerProvider
                                                .notifier)
                                            .register(
                                              email: _emailController.text,
                                              fullName:
                                                  _fullNameController.text,
                                              phoneNumber:
                                                  _phoneController.text,
                                              password:
                                                  _passwordController.text,
                                            );
                                        context.loaderOverlay.hide();
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
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //     10.0,
                                      //   ),
                                      //   borderSide: (ref.watch(
                                      //           _validConfirmPasswordProvider))
                                      //       ? BorderSide.none
                                      //       : const BorderSide(
                                      //           color: Colors.red,
                                      //           width: 2.0,
                                      //           style: BorderStyle.solid,
                                      //         ),
                                      // ),
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 9.0),
                                child: ElevatedButton(
                                  onPressed: (state.hasError ||
                                          _emailController.text.isEmpty ||
                                          _fullNameController.text.isEmpty ||
                                          _phoneController.text.isEmpty ||
                                          _passwordController.text.isEmpty ||
                                          _confirmPasswordController
                                              .text.isEmpty ||
                                          ref.watch(
                                                  _numberErrorFieldsProvider) !=
                                              0)
                                      ? null
                                      : () async {
                                          context.loaderOverlay.show();
                                          await ref
                                              .read(signUpControllerProvider
                                                  .notifier)
                                              .register(
                                                email: _emailController.text,
                                                fullName:
                                                    _fullNameController.text,
                                                phoneNumber:
                                                    _phoneController.text,
                                                password:
                                                    _passwordController.text,
                                              );
                                          context.loaderOverlay.hide();
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
