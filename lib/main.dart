import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'constants/custom_colors.dart';
import 'exceptions/async_error_logger.dart';
import 'features/authentication/data/repositories/fake_authentication_repository.dart';
import 'features/authentication/data/repositories/firebase_authentication_repository.dart';
import 'features/dashboard/data/apis/local/impl/sqlite_api_impl.dart';
import 'features/top_level_providers.dart';
import 'firebase_options.dart';
import 'routers/app_router.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();

  final localDB = await openDatabase(
    'freshly_main.db',
    version: 1,
    onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''
        CREATE TABLE products (
          id TEXT PRIMARY KEY,
          title TEXT NOT NULL, 
          price REAL NOT NULL, 
          offer INTEGER NOT NULL, 
          description TEXT NOT NULL, 
          image_path TEXT NOT NULL, 
          category TEXT NOT NULL,
          created_at TEXT NOT NULL,
          modified_at TEXT NOT NULL
        )
        ''');

      await db.execute('''
        CREATE TABLE advertisements (
          id TEXT PRIMARY KEY,
          description TEXT NOT NULL, 
          image_path TEXT NOT NULL, 
          is_special INTEGER NOT NULL,
          created_at TEXT NOT NULL,
          modified_at TEXT NOT NULL
        )
        ''');
    },
  );

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
      authenticationRepositoryProvider.overrideWith((ref) {
        final auth = FakeAuthenticationRepository();
        ref.onDispose(() => auth.dispose());
        ref.keepAlive();
        return auth;
      }),
      sqliteApiProvider.overrideWith((ref) {
        final sqliteApi = SQLiteApiImpl(localDB);
        ref.onDispose(
          () async => await localDB.close(),
        );
        return sqliteApi;
      }),
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    observers: [AsyncErrorLogger()],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final goRouter = ref.watch(goRouterProvider);
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Color.fromRGBO(23, 104, 46, 1.0),
        ),
      ),
      child: MaterialApp.router(
        title: 'Freshly Delivered',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'NG'), // English - Nigeria
        ],
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
      ),
    );
  }
}
