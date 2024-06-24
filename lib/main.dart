import 'dart:io';
import 'dart:ui';

import 'package:demo/project_routes/app_routes.dart';
import 'package:demo/screen/home.dart';
import 'package:demo/screen/httpRequests.dart';
import 'package:demo/screen/loginScreen.dart';
import 'package:demo/screen/second.dart';
import 'package:demo/screen/splashScreen.dart';
import 'package:demo/screen/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
   const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: '/http',
      //onGenerateRoute: MyAppRouter.generateRoute(),
      routes: {
       '/' : (context)=> const SplashScreen(),
       '/login' : (context)=> const LoginScreen(),
       '/home' : (context) => const Home(),
        '/second' : (context) => const SecondScreen(name: 'GO BACK !!!', description: 'this is second'),
        '/third' : (context)=> const ThirdScreen(t: 'This is last screen'),
        '/http' :(context)=>const HttpRequest(),
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
