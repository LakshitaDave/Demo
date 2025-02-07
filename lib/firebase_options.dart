// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAjJsoIaOPhuAWCjLSWwVVyWky39Suk90o',
    appId: '1:735922944191:web:0d472e2bea03dbf30a2e0a',
    messagingSenderId: '735922944191',
    projectId: 'fir-4d4df',
    authDomain: 'fir-4d4df.firebaseapp.com',
    storageBucket: 'fir-4d4df.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9alI4Ki_l2JyHbf5FyYzTaDc6AafZSeE',
    appId: '1:735922944191:android:9a4ed40fcd94f1400a2e0a',
    messagingSenderId: '735922944191',
    projectId: 'fir-4d4df',
    storageBucket: 'fir-4d4df.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2u0ldE4z0qrQjwpSfaYQZzTj5Ml4aX7c',
    appId: '1:735922944191:ios:d51f9bba9c29f7ac0a2e0a',
    messagingSenderId: '735922944191',
    projectId: 'fir-4d4df',
    storageBucket: 'fir-4d4df.appspot.com',
    androidClientId: '735922944191-eg4m3n9ilvghhnhmvaeqr5i1i9v13s02.apps.googleusercontent.com',
    iosClientId: '735922944191-5cc0ri7q0ra7th3bt3uhbjs1rkppaae9.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2u0ldE4z0qrQjwpSfaYQZzTj5Ml4aX7c',
    appId: '1:735922944191:ios:d51f9bba9c29f7ac0a2e0a',
    messagingSenderId: '735922944191',
    projectId: 'fir-4d4df',
    storageBucket: 'fir-4d4df.appspot.com',
    androidClientId: '735922944191-eg4m3n9ilvghhnhmvaeqr5i1i9v13s02.apps.googleusercontent.com',
    iosClientId: '735922944191-5cc0ri7q0ra7th3bt3uhbjs1rkppaae9.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjJsoIaOPhuAWCjLSWwVVyWky39Suk90o',
    appId: '1:735922944191:web:710924612e09b7b80a2e0a',
    messagingSenderId: '735922944191',
    projectId: 'fir-4d4df',
    authDomain: 'fir-4d4df.firebaseapp.com',
    storageBucket: 'fir-4d4df.appspot.com',
  );
}
