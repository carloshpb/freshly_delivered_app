import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/onboarding_screen.dart';
import '../features/authentication/presentation/screens/sign_up_screen.dart';
import '../features/authentication/presentation/screens/success_sign_up_screen.dart';
import '../features/dashboard/presentation/screens/home_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_login_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

/// Enum for Router
enum AppRouter {
  intro('/'),
  login('/login'),
  loginPhone('/login/phone'),
  loginName('/login/name'),
  loginProfile('/login/profile'),
  buyer('/comprador'),
  seller('/vendedor'),
  loginVerificationCode('/login/validation'),
  notFound('/not-found'),
  signUp("/sign-up"),
  successSignUp("/sign-up/success"),
  forgotPasswordLogin('/login/forgot-password'),
  resetLinkSent('/login/reset-link-sent'),
  home("/home");

  /// constructor with the path for the page
  const AppRouter(this.path);

  /// to get the path in String
  final String path;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouter.intro.path,
    routes: [
      GoRoute(
        path: AppRouter.intro.path,
        name: AppRouter.intro.name,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRouter.login.path,
        name: AppRouter.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.home.path,
        name: AppRouter.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRouter.signUp.path,
        name: AppRouter.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRouter.successSignUp.path,
        name: AppRouter.successSignUp.name,
        builder: (context, state) => const SuccessSignUpScreen(),
      ),
      GoRoute(
        path: AppRouter.forgotPasswordLogin.path,
        name: AppRouter.forgotPasswordLogin.name,
        builder: (context, state) => const ForgotPasswordLoginScreen(),
      ),
    ],
  );

  //final authService = ref.watch(authenticationService);
  // return GoRouter(
  //   navigatorKey: _rootNavigatorKey,
  //   initialLocation: AppRouter.intro.path,
  //   debugLogDiagnostics: false,
  //   redirect: (context, state) {
  //     final currentUser = authService.currentUser;
  //     return currentUser.when(
  //       (error) {
  //         return AppRouter.intro.path;
  //       },
  //       (success) => null,
  //     );
  //   },
  //   refreshListenable: GoRouterRefreshStream(authService.authStateChanges),
  //   routes: [
  //     GoRoute(
  //       path: AppRouter.intro.path,
  //       name: AppRouter.intro.name,
  //       builder: (context, state) => const IntroScreen(),
  //       routes: [
  //         GoRoute(
  //           path: AppRouter.loginPhone.path.substring(1),
  //           name: AppRouter.loginPhone.name,
  //           builder: (context, state) => const LoginPhoneScreen(),
  //         ),
  //         GoRoute(
  //           path: AppRouter.loginVerificationCode.path.substring(1),
  //           name: AppRouter.loginVerificationCode.name,
  //           builder: (context, state) => LoginVerificationCodeScreen(
  //             phoneState: state.extra! as LoginPhoneState,
  //           ),
  //         ),
  //         GoRoute(
  //           path: AppRouter.loginName.path.substring(1),
  //           name: AppRouter.loginName.name,
  //           builder: (context, state) => const LoginNameScreen(),
  //         ),
  //         GoRoute(
  //           path: AppRouter.loginProfile.path.substring(1),
  //           name: AppRouter.loginProfile.name,
  //           builder: (context, state) => const LoginProfileScreen(),
  //         ),
  //         ShellRoute(
  //           navigatorKey: _shellNavigatorKey,
  //           builder: (BuildContext context, GoRouterState state, Widget child) {
  //             return HomeScreen(child);
  //           },
  //           routes: [
  //             GoRoute(
  //               path: AppRouter.buyer.path.substring(1),
  //               name: AppRouter.buyer.name,
  //               builder: (context, state) => const HomeBuyerScreen(),
  //             ),
  //             GoRoute(
  //               path: AppRouter.seller.path.substring(1),
  //               name: AppRouter.seller.name,
  //               builder: (context, state) => const HomeSellerScreen(),
  //             ),
  //             // GoRoute(
  //             //   path: '/configurations',
  //             //   name: AppRouter.configurations.name,
  //             //   builder: (context, state) => const MainConfigurationScreen(),
  //             // ),
  //             // GoRoute(
  //             //   path: '/notifications',
  //             //   name: AppRouter.notifications.name,
  //             //   builder: (context, state) => const MainNotificationScreen(),
  //             // ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ],
  //   errorBuilder: (context, state) => const NotFoundScreen(),
  // );
});
