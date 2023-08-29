import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../exceptions/app_auth_exception.dart';
import '../features/authentication/application/use_cases/auth_state_use_case_impl.dart';
import '../features/authentication/domain/models/app_user.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/onboarding_screen.dart';
import '../features/authentication/presentation/screens/sign_up_screen.dart';
import '../features/authentication/presentation/screens/success_sign_up_screen.dart';
import '../features/dashboard/application/dtos/product_dto.dart';
import '../features/dashboard/presentation/screens/cart_screen.dart';
import '../features/dashboard/presentation/screens/home_screen.dart';
import '../features/authentication/presentation/screens/forgot_password_login_screen.dart';
import '../features/dashboard/presentation/screens/item_details_screen.dart';
import '../features/dashboard/presentation/screens/scaffold_with_nested_navigation.dart';
import '../features/dashboard/presentation/screens/search_results_screen.dart';
import '../features/dashboard/presentation/screens/settings_screen.dart';
import '../features/dashboard/presentation/screens/wishlist_screen.dart';
import 'not_found_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorWishlistKey =
    GlobalKey<NavigatorState>(debugLabel: 'wishlist');
final _shellNavigatorCartKey = GlobalKey<NavigatorState>(debugLabel: 'cart');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');

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
  signUp("sign-up"),
  successSignUp("success"),
  forgotPasswordLogin('forgot-password'),
  resetLinkSent('/login/reset-link-sent'),
  home("/home"),
  wishlist("/wishlist"),
  cart("/cart"),
  settings("/settings"),
  itemDetails("item-details"),
  searchResults("search-results"),
  onSales("on-sales");

  /// constructor with the path for the page
  const AppRouter(this.path);

  /// to get the path in String
  final String path;
}

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authStateUseCaseProvider);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: (authState.hasValue && authState.value is UserData)
          ? AppRouter.home.path
          : AppRouter.intro.path,
      routes: [
        // Stateful nested navigation based on:
        // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // the UI shell
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            // first branch (Home)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: AppRouter.home.path,
                  name: AppRouter.home.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomeScreen(),
                  ),
                  routes: [
                    // child route
                    GoRoute(
                      path: AppRouter.itemDetails.path,
                      name: AppRouter.itemDetails.name,
                      builder: (context, state) {
                        var product = state.extra as ProductDto?;
                        return (product == null)
                            ? const NotFoundScreen()
                            : ItemDetailsScreen(
                                product: product,
                              );
                      },
                    ),
                    GoRoute(
                      path: AppRouter.searchResults.path,
                      name: AppRouter.searchResults.name,
                      builder: (context, state) {
                        return SearchResultsScreen(
                          searchText: state.pathParameters['product-name']!,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            // second branch (Wishlist)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorWishlistKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: AppRouter.wishlist.path,
                  name: AppRouter.wishlist.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: WishlistScreen(),
                  ),
                  routes: [
                    // child route
                    // GoRoute(
                    //   path: 'details',
                    //   builder: (context, state) =>
                    //       const DetailsScreen(label: 'B'),
                    // ),
                  ],
                ),
              ],
            ),
            // second branch (Cart)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorCartKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: AppRouter.cart.path,
                  name: AppRouter.cart.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: CartScreen(),
                  ),
                  routes: [
                    // child route
                    // GoRoute(
                    //   path: 'details',
                    //   builder: (context, state) =>
                    //       const DetailsScreen(label: 'B'),
                    // ),
                  ],
                ),
              ],
            ),
            // third branch (Settings)
            StatefulShellBranch(
              navigatorKey: _shellNavigatorSettingsKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: AppRouter.settings.path,
                  name: AppRouter.settings.name,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: SettingsScreen(),
                  ),
                  routes: [
                    // child route
                    // GoRoute(
                    //   path: 'details',
                    //   builder: (context, state) =>
                    //       const DetailsScreen(label: 'B'),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: AppRouter.intro.path,
          name: AppRouter.intro.name,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: AppRouter.login.path,
          name: AppRouter.login.name,
          builder: (context, state) => LoginScreen(
            exception: (state.extra as Exception?),
          ),
          routes: [
            GoRoute(
              path: AppRouter.signUp.path,
              name: AppRouter.signUp.name,
              builder: (context, state) => const SignUpScreen(),
              routes: [
                GoRoute(
                  path: AppRouter.successSignUp.path,
                  name: AppRouter.successSignUp.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const SuccessSignUpScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: AppRouter.forgotPasswordLogin.path,
              name: AppRouter.forgotPasswordLogin.name,
              builder: (context, state) => const ForgotPasswordLoginScreen(),
            ),
          ],
        ),
      ],
      // redirect to the login page if the user is not logged in
      redirect: (context, state) {
        // If our async state is loading, don't perform redirects, yet
        if (authState.isLoading) {
          return null;
        } else if (authState.hasError && authState.error is AppAuthException) {
          // TODO : Treat better each Auth Exception to each route that was thrown by authStateChangesProvider
          switch (authState.error) {
            case UserNotFoundException():
              context.goNamed(
                AppRouter.login.path,
                extra: authState.error,
              );
              return null;
            default:
              return null;
          }
        }

        // Here we guarantee that hasData == true, i.e. we have a readable value

        switch (authState.value!) {
          case UserData():
            return (state.fullPath == AppRouter.login.path)
                ? AppRouter.home.path
                : null;
          default:
            return (state.fullPath == AppRouter.login.path)
                ? null
                : AppRouter.login.path;
        }
      },
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
  },
);
