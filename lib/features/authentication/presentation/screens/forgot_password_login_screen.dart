import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/ensure_visible_when_focused.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/paths.dart';
import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../../routers/app_router.dart';
import '../controllers/forgot_password_login_controller.dart';

class ForgotPasswordLoginScreen extends ConsumerStatefulWidget {
  const ForgotPasswordLoginScreen({super.key});

  @override
  ConsumerState<ForgotPasswordLoginScreen> createState() =>
      _ForgotPasswordLoginScreenState();
}

class _ForgotPasswordLoginScreenState
    extends ConsumerState<ForgotPasswordLoginScreen> {
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
    final mediaQuerySize = MediaQuery.sizeOf(context);
    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
      leading: BackButton(
        onPressed: () => ref.read(goRouterProvider).go(AppRouter.login.path),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.mainGreen,
      appBar: appBar,
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
                      // height: (constraints.maxHeight) * 0.21522,
                      height: (mediaQuerySize.height * 0.28) -
                          appBar.preferredSize.height,
                      child: Center(
                        child: Image.asset(
                          // height: (constraints.maxHeight) * 0.1189,
                          height: (mediaQuerySize.height) * 0.1185,
                          Paths.logoPath,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (mediaQuerySize.height * 0.1825),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.recoverAccount.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 134, 52, 1.0),
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            Strings.recoverPassMessage.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          EnsureVisibleWhenFocused(
                            focusNode: emailFocusNode,
                            child: TextField(
                              autofillHints: const [AutofillHints.email],
                              controller: _emailController,
                              textAlign: TextAlign.center,
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
                                      .read(
                                          forgotPasswordLoginControllerProvider
                                              .notifier)
                                      .clearState();
                                }
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: Strings.sampleEmail,
                                hintStyle: const TextStyle(
                                  color: Colors.black45,
                                ),
                                errorText: (ref
                                            .watch(
                                                forgotPasswordLoginControllerProvider)
                                            .hasError &&
                                        (ref
                                                    .watch(
                                                        forgotPasswordLoginControllerProvider)
                                                    .error
                                                is UserNotFoundException ||
                                            ref
                                                    .watch(
                                                        forgotPasswordLoginControllerProvider)
                                                    .error
                                                is InvalidEmailException))
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          Strings.resetMyAccount.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
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
