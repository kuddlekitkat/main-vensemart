import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/OnboardingScreen.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

import 'ChoiceIntroScreen.dart';
import 'apiservices/provider/provider.dart';
import 'core/injector.dart';
import 'core/session_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getProviders,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vensemart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // ignore: unnecessary_null_comparison
        home: SessionManager.instance.authToken.isNotEmpty
            ? const ChoiceIntroScreen()
            : const OnboardingScreen(),
        routes: {
          ServicesHomeScreen.routeName: (ctx) => const ServicesHomeScreen(),
          LoginScreen.routeName: (ctx) => const ServicesHomeScreen(),
          AvailableServicesListScreen.routeName: (ctx) =>
              const AvailableServicesListScreen(),
        },
      ),
    );
  }
}
