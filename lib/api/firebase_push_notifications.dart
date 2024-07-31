

import 'dart:convert';

import 'package:demo/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('App opened from background state by a message');
  print('Title: ${message.notification?.title}  background state');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

void handleMessage(RemoteMessage? message){
  if(message==null)return;

  navigatorKey.currentState?.pushNamed('/settings',arguments:message);//[message.notification?.title,message.notification?.body,message.data]);
}

class FirebasePushNotifications {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

   Future init() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
    );

    final fcmToken = await _firebaseMessaging.getToken();
    print('token : $fcmToken');

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      final notification = message.notification;
      if(notification == null)return;

      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon:'@drawable/ic_launcher',
            )
          ),
        payload: notification.body,

      );
    });



      const android = AndroidInitializationSettings('@drawable/ic_launcher');
      const settings = InitializationSettings(android: android);

      await _localNotifications.initialize(
          settings,

        onDidReceiveNotificationResponse: (NotificationResponse response) {
          final String? payload = response.payload;
          print(payload);
          //if (payload != null) {
          //final message = RemoteMessage.fromMap(jsonDecode(payload));
          navigatorKey.currentState?.pushNamed('/notification',arguments: payload);
          //handleMessage(response as RemoteMessage?);
        }
      );

      final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await platform?.createNotificationChannel(_androidChannel);
  }
}