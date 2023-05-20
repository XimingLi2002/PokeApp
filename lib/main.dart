import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_app/providers/app_theme_provider.dart';
import 'package:pokemon_app/routes/go_router_provider.dart';

import 'enums/app_colors.dart';
import 'utils/custom_text_themes.dart';

// PRINCIPAL DIFERENCIA ENTRE UTILIZAR '//' Y '///' A LA HORA DE COMENTAR:
// CUANDO SE UTLIZA '///' EL COMENTARIO SE GUARDA EN EL CODIGO (FUNCIÓN, CLASE, OBJETO...), ES DECIR,
// POR EJEMPLO SI PONEMOS EL CURSOR ENCIMA DE LA FUNCIÓN MAIN NOS APARECERÁ EL COMENTARIO

/// Initializes the Flutter framework
Future<void> main() async {
  // This method is used to ensure that the WidgetsBinding is initialized before calling runApp() to start the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Firebase
  await Firebase.initializeApp();

  // Method used to run the flutter application
  runApp(
    // [ProviderScope] Used to initialize the Riverpod framework.
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

/// [firebaseInitializerProvider] Check whether Firebase is initialized or not, using FutureProvider.
final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: blackMountainView,
        scaffoldBackgroundColor: AppColors.primary100.color,
        cardTheme: CardTheme(color: AppColors.white.color),
        listTileTheme: ListTileThemeData(tileColor: AppColors.white.color),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary100.color,
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: AppColors.black.color,
            unselectedItemColor: Colors.grey.shade400,
            enableFeedback: true),
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          cardTheme: CardTheme(color: AppColors.grey800.color),
          listTileTheme: ListTileThemeData(
              tileColor: AppColors.grey800.color,
              iconColor: AppColors.white.color),
          textTheme: whiteMountainView,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.white.color,
              unselectedItemColor: Colors.grey.shade400,
              enableFeedback: true)),
      themeMode: ref.watch(providerAppTheme) ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
