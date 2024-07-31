
import 'package:demo/api/firebase_push_notifications.dart';
import 'package:demo/screen/bottom_navbar.dart';
import 'package:demo/screen/googleMapScreen.dart';
import 'package:demo/screen/home.dart';
import 'package:demo/screen/imagePick.dart';
import 'package:demo/screen/loginScreen.dart';
import 'package:demo/screen/notification.dart';
import 'package:demo/screen/second.dart';
import 'package:demo/screen/settings.dart';
import 'package:demo/screen/splashScreen.dart';
import 'package:demo/screen/tabview.dart';
import 'package:demo/screen/third.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebasePushNotifications().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: '/',
      navigatorKey: navigatorKey,
      //onGenerateRoute: MyAppRouter.generateRoute(),
      routes: {
       '/' : (context)=> const SplashScreen(),
       '/login' : (context)=> const LoginScreen(),
        '/home' : (context) => const Home(),
        '/second' : (context) => const SecondScreen(name: 'GO BACK !!!', description: 'this is second'),
        '/third' : (context)=> const ThirdScreen(t: 'This is last screen'),
       '/bottomNavbar' :(context)=>const BottomNavbar(),
        '/tab'  : (context)=>const TabView(),
        '/picker' : (context)=>const ImagePick(),
        '/settings' : (context)=> Settings(),
        '/notification':(context)=> NotificationScreen(),
        '/google' :(context)=>GoogleMapScreen(),


      },
    );
  }
}




// class Demo extends StatefulWidget {
//   const Demo({super.key});
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//
//   bool _isOn = false;
//
//   void _toggle() {
//     setState(() {
//       _isOn = !_isOn;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggle,
//       child: Container(
//         color: _isOn ? Colors.green : Colors.grey,
//         width: 48.0,
//         height: 48.0,
//       ),
//     );
//   }
// }
