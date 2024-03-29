import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackGroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance
        .getInitialMessage()
        .then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp
        .listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token : $fCMToken");
    initPushNotifications();
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
  }
}
