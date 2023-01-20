import 'package:firebase_messaging/firebase_messaging.dart';



final firebaseService = FirebaseServicesClass();

class FirebaseServicesClass {
  FirebaseServicesClass();

  Future<void> _onOpenAppMessageOnBackground(context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    print('psuh whaz ${initialMessage.toString()}');
    if (initialMessage != null) {}
  }

  firebasePushNotification(context) {
    _onOpenAppMessageOnBackground(context);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification? androidNotification = message.notification?.android;
      if (notification != null && androidNotification != null) {

        //this is to know what pay load u are receiving,here u can show a dialog pop up when u tap on the notification
        print('psuh whaz ${notification.toString()}');
      }
    });
  }
}
