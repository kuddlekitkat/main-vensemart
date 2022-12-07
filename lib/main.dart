
import 'package:flutter/material.dart';
import 'package:vensemart/ChoiceIntroScreen.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/OnboardingScreen.dart';
import 'package:vensemart/OtpVerification.dart';
import 'package:vensemart/RegisterScreen.dart';
import 'package:vensemart/products/screens/DeliveryDetailsScreen.dart';
import 'package:vensemart/products/screens/ProductDetailScreen.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/products/screens/ProductsSuccessScreen.dart';
import 'package:vensemart/products/screens/ShopDetailScreen.dart';
import 'package:vensemart/products/widgets/full_pages/ProductsHome.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ServiceDetailScreen.dart';
import 'package:vensemart/services/screens/ServicesGridScreen.dart';
import 'package:vensemart/services/screens/ServicesHome.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';
import 'package:vensemart/services/screens/ServicesProfileScreen.dart';
import 'package:vensemart/services/screens/ServicesSuccessScreen.dart';
import 'package:vensemart/services/screens/TrendingServicesScreen.dart';
import 'package:vensemart/services/widgets/components/ServiceCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vensemart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
      routes: {
        ServicesHomeScreen.routeName: (ctx) => ServicesHomeScreen(),
        LoginScreen.routeName: (ctx) => ServicesHomeScreen(),
        AvailableServicesListScreen.routeName: (ctx) => AvailableServicesListScreen(),

      },
    );
  }
}


