import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/ChoiceIntroScreen.dart';
import 'package:vensemart/LoginScreen.dart';
import 'package:vensemart/OnboardingScreen.dart';
import 'package:vensemart/products/screens/CartScreen.dart';
import 'package:vensemart/products/screens/ProductDetailScreen.dart';
import 'package:vensemart/products/screens/ProductsHomeScreen.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';
import 'apiservices/provider/provider.dart';
import 'core/injector.dart';
import 'core/session_manager.dart';

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
  await FlutterConfig.loadEnvVariables();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
  OneSignal.shared.setAppId("580dc8b3-a23b-4ef4-9ec9-fa1fd78c83bb");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  // printKeyHash();

  runApp(const MyApp());
}

// void printKeyHash() async {
//   print('printing key now');
//   String? key = await FlutterFacebookKeyhash.getFaceBookKeyHash ??
//       'Unknown platform version';
//   print(key ?? "");
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            ? const ProductsHomeScreen()
            : const OnboardingScreen(),
        routes: {
          ServicesHomeScreen.routeName: (ctx) => const ServicesHomeScreen(),
          LoginScreen.routeName: (ctx) => const ServicesHomeScreen(),
          AvailableServicesListScreen.routeName: (ctx) =>
              AvailableServicesListScreen(
                  lat: 8.toString(), long: 9.toString(), id: 385.toString()),
        },
      ),
    );
  }
}
