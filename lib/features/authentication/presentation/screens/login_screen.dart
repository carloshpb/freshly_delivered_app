import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/custom_snackbar.dart';
import '../../../../common_widgets/ensure_visible_when_focused.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/paths.dart';
import '../../../../constants/strings.dart';
import '../../../../exceptions/app_auth_exception.dart';
import '../../../../routers/app_router.dart';
import '../controllers/login_controller.dart';

final _passwordVisibleStateProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // create a TextEditingController
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // error handling
    ref.listen<AsyncValue<void>>(
      loginControllerProvider,
      (_, state) => state.whenOrNull(
        error: (error, stackTrace) {
          if (!(error is UserNotFoundException ||
              error is WrongPasswordException)) {
            CustomSnackbar.showErrorToast(context, 'Erro', error.toString());
          }
        },
      ),
    );

    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
    );

    final mediaQuerySize = MediaQuery.sizeOf(context);
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
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
                      height: (mediaQuerySize.height * 0.28) -
                          appBar.preferredSize.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Paths.logoPath,
                            height: (mediaQuerySize.height) * 0.1185,
                          ),
                          Text(
                            Strings.login.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Text(
                              Strings.email.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        EnsureVisibleWhenFocused(
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
                              if (ref.read(loginControllerProvider).hasError &&
                                  ref.read(loginControllerProvider).error
                                      is UserNotFoundException) {
                                ref
                                    .read(loginControllerProvider.notifier)
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
                                          .watch(loginControllerProvider)
                                          .hasError &&
                                      ref.watch(loginControllerProvider).error
                                          is UserNotFoundException)
                                  ? (ref.watch(loginControllerProvider).error
                                          as UserNotFoundException)
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
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 26.0, bottom: 14.0),
                            child: Text(
                              Strings.password.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                        EnsureVisibleWhenFocused(
                          focusNode: passwordFocusNode,
                          child: TextField(
                            autofillHints: const [AutofillHints.password],
                            controller: _passwordController,
                            keyboardType:
                                (ref.watch(_passwordVisibleStateProvider))
                                    ? TextInputType.text
                                    : TextInputType.visiblePassword,
                            focusNode: passwordFocusNode,
                            obscureText:
                                ref.watch(_passwordVisibleStateProvider),
                            enableSuggestions: false,
                            style: const TextStyle(
                              color: CustomColors.buttonGreen,
                              fontSize: 16.0,
                            ),
                            onChanged: (_) {
                              if (ref.read(loginControllerProvider).hasError &&
                                  ref.read(loginControllerProvider).error
                                      is WrongPasswordException) {
                                ref
                                    .read(loginControllerProvider.notifier)
                                    .clearState();
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              errorText: (ref
                                          .watch(loginControllerProvider)
                                          .hasError &&
                                      ref.watch(loginControllerProvider).error
                                          is WrongPasswordException)
                                  ? (ref.watch(loginControllerProvider).error
                                          as WrongPasswordException)
                                      .message
                                  : null,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: CustomColors.greenIcon,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  ref.watch(_passwordVisibleStateProvider)
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: CustomColors.greenIcon,
                                ),
                                onPressed: () {
                                  ref
                                          .read(_passwordVisibleStateProvider
                                              .notifier)
                                          .state =
                                      !ref.read(_passwordVisibleStateProvider);
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 11.0, bottom: 25.0),
                          child: Row(
                            children: [
                              const Text(
                                Strings.forgotPasword,
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () => ref
                                    .read(goRouterProvider)
                                    .go(AppRouter.forgotPasswordLogin.path),
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  Strings.recover.toUpperCase(),
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
                        ElevatedButton(
                          onPressed: (ref
                                      .watch(loginControllerProvider)
                                      .hasError &&
                                  (ref.watch(loginControllerProvider).error
                                          is WrongPasswordException ||
                                      ref.watch(loginControllerProvider).error
                                          is UserNotFoundException))
                              ? null
                              : () => ref
                                  .read(loginControllerProvider.notifier)
                                  .signIn(_emailController.text,
                                      _passwordController.text),
                          child: Text(
                            Strings.login.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
