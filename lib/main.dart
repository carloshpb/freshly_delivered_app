import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/custom_colors.dart';
import 'exceptions/async_error_logger.dart';
import 'features/authentication/data/repositories/fake_authentication_repository.dart';
import 'features/authentication/data/repositories/firebase_authentication_repository.dart';
import 'firebase_options.dart';
import 'routers/app_router.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Emulator Firebase Auth for tests
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // * Create ProviderContainer with any required overrides
  final container = ProviderContainer(
    overrides: [
      authenticationRepositoryProvider
          .overrideWithValue(FakeAuthenticationRepository()),
    ],
    observers: [AsyncErrorLogger()],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Freshly Delivered',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: CustomColors.mainGreen,
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: CustomColors.buttonGreenDeactivated,
            minimumSize: const Size.fromHeight(54.0),
            backgroundColor: CustomColors.buttonGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      routerConfig: goRouter,
    );
  }
}
