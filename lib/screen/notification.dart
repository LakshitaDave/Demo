import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../api/firebase_push_notifications.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final payload = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Foreground notification'),
            Text('payload : $payload'),
          ],
        ),
      ),
    );
  }
}
