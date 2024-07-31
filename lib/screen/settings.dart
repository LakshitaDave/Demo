import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../api/firebase_push_notifications.dart';

class Settings extends StatelessWidget {
  final payload;
  const Settings({super.key, this.payload,});

  @override
  Widget build(BuildContext context) {
    final RemoteMessage? message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User settings'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Change settings'),
            Text('Notifications : '),
            Text('${message?.notification?.title}'),
           Text('${message?.notification?.body}'),
            Text('${message?.data}'),
          ],
        ),
      ),
    );
  }
}
