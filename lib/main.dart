
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/OnboardingScreen.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

import 'apiservices/provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: Providers.getProviders,
      builder:(_,__)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vensemart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnboardingScreen(),
        routes: {
          ServicesHomeScreen.routeName: (ctx) => const ServicesHomeScreen(),
          LoginScreen.routeName: (ctx) => const ServicesHomeScreen(),
          AvailableServicesListScreen.routeName: (ctx) => const AvailableServicesListScreen(),
    
        },
      ),
    );
  }
}


