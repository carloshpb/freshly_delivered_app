import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../common_widgets/custom_snackbar.dart';
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
    final state = ref.watch(forgotPasswordLoginControllerProvider);
    final resendTimeMailLinkState = ref.watch(resendTimeMailLinkProvider);
    final goRouterState = ref.watch(goRouterProvider);
    final forgotPasswordScreenController =
        ref.read(forgotPasswordLoginControllerProvider.notifier);

    final mediaQuerySize = MediaQuery.sizeOf(context);
    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
      leading: BackButton(
        color: Colors.white,
        onPressed: () => goRouterState.go(AppRouter.login.path),
      ),
    );

    // error handling
    ref.listen<AsyncValue<bool>>(
      forgotPasswordLoginControllerProvider,
      (previousState, nextState) {
        if (previousState!.isLoading) {
          context.loaderOverlay.hide();
        }

        nextState.whenOrNull(
          data: (isSent) {
            if (isSent && (previousState.value!)) {
              CustomSnackbar.showSuccessToast(context,
                  Strings.sentNewResetLinkMail, Strings.sentResetLinkMessage);
            }
          },
          loading: () => context.loaderOverlay.show(),
          error: (error, stackTrace) {
            CustomSnackbar.showErrorToast(context, 'Error', error.toString());
          },
        );
      },
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
                      child: AnimatedCrossFade(
                        crossFadeState: !state.value!
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(seconds: 1),
                        firstChild: Column(
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
                            TextField(
                              autofillHints: const [AutofillHints.email],
                              controller: _emailController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(
                                color: CustomColors.buttonGreen,
                                fontSize: 16.0,
                              ),
                              onChanged: (_) {
                                if (state.hasError &&
                                    (state.error is UserNotFoundException ||
                                        state.error is InvalidEmailException)) {
                                  forgotPasswordScreenController.clearState();
                                }
                              },
                              onEditingComplete: () {
                                if (!((state.hasError &&
                                        (state.error is InvalidEmailException ||
                                            state.error
                                                is UserNotFoundException)) ||
                                    state.isLoading)) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  forgotPasswordScreenController
                                      .sendPasswordResetEmail(
                                          _emailController.text);
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
                                        (state.error is UserNotFoundException ||
                                            state.error
                                                is InvalidEmailException))
                                    ? (state.error as AppAuthException).message
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        secondChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Strings.resetLinkSent.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromRGBO(245, 134, 52, 1.0),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              Strings.sentResetLinkMessage.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              Strings.questionNoResetPassSentLink.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : (resendTimeMailLinkState != 0 ||
                                    state.hasError &&
                                        (state.error is InvalidEmailException ||
                                            state.error
                                                is UserNotFoundException))
                                ? null
                                : () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    forgotPasswordScreenController
                                        .sendPasswordResetEmail(
                                            _emailController.text);
                                  },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: AnimatedCrossFade(
                          crossFadeState: !state.value!
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(seconds: 1),
                          firstChild: Text(
                            Strings.resetMyAccount.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          secondChild: Text(
                            resendTimeMailLinkState == 0
                                ? Strings.resend.toUpperCase()
                                : resendTimeMailLinkState.toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: AnimatedOpacity(
                        opacity: !state.value! ? 0.0 : 1.0,
                        alwaysIncludeSemantics: true,
                        duration: const Duration(seconds: 1),
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
                              onPressed: () =>
                                  goRouterState.go(AppRouter.login.path),
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
                          onPressed: () =>
                              goRouterState.go(AppRouter.signUp.path),
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
