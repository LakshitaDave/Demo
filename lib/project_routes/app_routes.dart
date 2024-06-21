import 'package:demo/screen/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/home.dart';

class MyAppRouter {
  static Object generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>const Home());
      case '/second' :
        return MaterialPageRoute(builder: (_)=> const SecondScreen(name: "Hello", description: "Bye"));
      default:
        return  Scaffold(
          appBar: AppBar(title: const Text("Error Screen"),),
        );
    }
  }
}