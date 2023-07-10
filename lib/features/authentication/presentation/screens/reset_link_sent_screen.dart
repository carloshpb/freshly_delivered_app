import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/ensure_visible_when_focused.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/paths.dart';
import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../../routers/app_router.dart';
import '../controllers/forgot_password_login_controller.dart';

class ResetLinkSentScreen extends ConsumerStatefulWidget {
  const ResetLinkSentScreen({super.key});

  @override
  ConsumerState<ResetLinkSentScreen> createState() =>
      _ResetLinkSentScreenState();
}

class _ResetLinkSentScreenState extends ConsumerState<ResetLinkSentScreen> {
  final _emailController = TextEditingController();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.mainGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: constraints,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: (constraints.maxHeight) * 0.21522,
                      child: Center(
                        child: Image.asset(
                          height: (constraints.maxHeight) * 0.1189,
                          Paths.logoPath,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          Strings.resetLinkSent.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(245, 134, 52, 1.0),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          Strings.sentResetLinkMessage.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Text(
                          Strings.questionNoResetPassSentLink.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: EnsureVisibleWhenFocused(
                        focusNode: emailFocusNode,
                        child: TextField(
                          autofillHints: const [AutofillHints.email],
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                          style: const TextStyle(
                            color: CustomColors.buttonGreen,
                            fontSize: 16.0,
                          ),
                          onChanged: (_) {
                            if (ref
                                    .watch(
                                        forgotPasswordLoginControllerProvider)
                                    .hasError &&
                                (ref
                                        .watch(
                                            forgotPasswordLoginControllerProvider)
                                        .error is UserNotFoundException ||
                                    ref
                                        .watch(
                                            forgotPasswordLoginControllerProvider)
                                        .error is InvalidEmailException)) {
                              ref
                                  .read(forgotPasswordLoginControllerProvider
                                      .notifier)
                                  .clearState();
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: CustomColors.greenIcon,
                            ),
                            errorText: (ref
                                        .watch(
                                            forgotPasswordLoginControllerProvider)
                                        .hasError &&
                                    (ref
                                            .watch(
                                                forgotPasswordLoginControllerProvider)
                                            .error is UserNotFoundException ||
                                        ref
                                            .watch(
                                                forgotPasswordLoginControllerProvider)
                                            .error is InvalidEmailException))
                                ? (ref
                                        .watch(
                                            forgotPasswordLoginControllerProvider)
                                        .error as AppAuthException)
                                    .message
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
                      padding: const EdgeInsets.only(top: 11.0),
                      child: ElevatedButton(
                        onPressed: (ref
                                    .watch(
                                        forgotPasswordLoginControllerProvider)
                                    .hasError &&
                                (ref
                                        .watch(
                                            forgotPasswordLoginControllerProvider)
                                        .error is InvalidEmailException ||
                                    ref
                                        .watch(
                                            forgotPasswordLoginControllerProvider)
                                        .error is UserNotFoundException))
                            ? null
                            : () => ref
                                .read(forgotPasswordLoginControllerProvider
                                    .notifier)
                                .sendPasswordResetEmail(_emailController.text),
                        child: Text(
                          Strings.login.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
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
                              "${Strings.login} ${Strings.here}".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.questionDontHaveAccount,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () => ref
                              .read(goRouterProvider)
                              .go(AppRouter.signUp.path),
                          child: Text(
                            Strings.register.toUpperCase(),
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
            );
          }),
        ),
      ),
    );
  }
}
