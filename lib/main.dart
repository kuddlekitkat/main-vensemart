import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/OnboardingScreen.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

import 'ChoiceIntroScreen.dart';
import 'apiservices/provider/provider.dart';
import 'core/injector.dart';
import 'core/session_manager.dart';
import 'services/screens/ServicesGridScreen.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title// description
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCore();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(SessionManager.instance.authToken);
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
              AvailableServicesListScreen(lat: 8.toString(),long: 9.toString(),id: 385.toString()),
        },
      ),
    );
  }
}