import 'dart:async';

import 'package:demo/screen/bottom_navbar.dart';
import 'package:demo/screen/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>const BottomNavbar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Icon(Icons.account_circle,color: Colors.white,size: 100,),
      ),
    );
  }
}
