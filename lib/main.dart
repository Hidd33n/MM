import 'package:flutter/material.dart';
import 'package:mm/core/customnavbar/customnav.dart';
import 'package:mm/core/themes/themelist/dartk.dart';
import 'package:mm/core/themes/themelist/light.dart';
import 'package:mm/core/themes/themeprovider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mm/data/auth/verifyauth.dart';
import 'package:mm/firebase_options.dart';
import 'package:mm/presentation/home/screens/homescreen.dart';
import 'package:mm/presentation/login/screens/loginscreen.dart';
import 'package:mm/presentation/register/screens/registerscreen.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      path: 'assets/translate',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // Proveedor de autenticación
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()), // Proveedor de tema
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: '/login',
            theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
            builder: (context, child) {
              return WillPopScope(
                onWillPop: () async {
                  // Desactivar la funcionalidad de volver atrás
                  return false;
                },
                child: child!,
              );
            },
            routes: {
              '/cnav': (context) => CustomNav(),
              '/login': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
              '/home': (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
