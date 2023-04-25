import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/custom_colors.dart';
import 'routers/app_router.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const ProviderScope(
      child: App(),
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
