import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
  final Exception? exception;

  const LoginScreen({super.key, this.exception});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // create a TextEditingController
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.exception != null) {
        CustomSnackbar.showErrorToast(
            context, 'Error', widget.exception.toString());
      }
    });
  }

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    final loginController = ref.watch(loginControllerProvider.notifier);

    // error handling
    ref.listen<AsyncValue<void>>(
      loginControllerProvider,
      (previousState, nextState) {
        if (context.loaderOverlay.visible) {
          context.loaderOverlay.hide();
        }
        nextState.whenOrNull(
          loading: () => context.loaderOverlay.show(),
          error: (error, stackTrace) {
            if (!(error is UserNotFoundException ||
                error is WrongPasswordException)) {
              CustomSnackbar.showErrorToast(context,
                  (error is AppAuthException) ? '' : 'Error', error.toString());
            }
          },
        );
      },
    );

    final appBar = AppBar(
      backgroundColor: CustomColors.mainGreen,
    );

    final mediaQuerySize = MediaQuery.sizeOf(context);
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: CustomColors.mainGreen,
        appBar: appBar,
        body: SafeArea(
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
                    height: mediaQuerySize.height -
                        appBar.preferredSize.height -
                        kToolbarHeight,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: (mediaQuerySize.height * 0.28) -
                              appBar.preferredSize.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 600.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
                                  child: Text(
                                    Strings.email.toUpperCase(),
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
                                    child: TextField(
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      focusNode: emailFocusNode,
                                      style: const TextStyle(
                                        color: CustomColors.buttonGreen,
                                        fontSize: 16.0,
                                      ),
                                      onChanged: (email) =>
                                          loginController.updateEmail(email),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                          Icons.mail,
                                          color: CustomColors.greenIcon,
                                        ),
                                        errorText: (state.hasError &&
                                                state.error
                                                    is UserNotFoundException)
                                            ? (state.error
                                                    as UserNotFoundException)
                                                .message
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
                                  child: Text(
                                    Strings.password.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
                                  child:
                                      Consumer(builder: (context, passRef, _) {
                                    return EnsureVisibleWhenFocused(
                                      focusNode: passwordFocusNode,
                                      child: TextField(
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        controller: _passwordController,
                                        keyboardType: (passRef.watch(
                                                _passwordVisibleStateProvider))
                                            ? TextInputType.text
                                            : TextInputType.visiblePassword,
                                        focusNode: passwordFocusNode,
                                        obscureText: passRef.watch(
                                            _passwordVisibleStateProvider),
                                        enableSuggestions: false,
                                        style: const TextStyle(
                                          color: CustomColors.buttonGreen,
                                          fontSize: 16.0,
                                        ),
                                        onChanged: (password) => loginController
                                            .updatePassword(password),
                                        onEditingComplete: () async {
                                          if (!state.hasError &&
                                              _emailController
                                                  .text.isNotEmpty &&
                                              _passwordController
                                                  .text.isNotEmpty) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            loginController.signIn();
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          errorText: (ref
                                                      .watch(
                                                          loginControllerProvider)
                                                      .hasError &&
                                                  ref
                                                          .watch(
                                                              loginControllerProvider)
                                                          .error
                                                      is WrongPasswordException)
                                              ? (ref
                                                          .watch(
                                                              loginControllerProvider)
                                                          .error
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
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              passRef.watch(
                                                      _passwordVisibleStateProvider)
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: CustomColors.greenIcon,
                                            ),
                                            onPressed: () {
                                              ref
                                                      .watch(
                                                          _passwordVisibleStateProvider
                                                              .notifier)
                                                      .state =
                                                  !ref.watch(
                                                      _passwordVisibleStateProvider);
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
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
                                            .watch(goRouterProvider)
                                            .go(AppRouter
                                                .forgotPasswordLogin.path),
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
                                  onPressed: ((state.hasError &&
                                              (state.error
                                                      is WrongPasswordException ||
                                                  state.error
                                                      is UserNotFoundException)) ||
                                          state.value!.$1.isEmpty ||
                                          state.value!.$2.isEmpty)
                                      ? null
                                      : () => loginController.signIn(),
                                  child: Text(
                                    Strings.login.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
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
                                          .watch(goRouterProvider)
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
