import 'package:demo/screen/googleMapScreen.dart';
import 'package:demo/screen/home.dart';
import 'package:demo/screen/httpRequests.dart';
import 'package:demo/screen/settings.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late int _selectedIndex =0;
  final _pageController = PageController();
  final List pages = [
    const Home(),
    const HttpRequest(),
     const Settings()];

  void _onItemTapped(int index){

    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home',),
              BottomNavigationBarItem(icon: Icon(Icons.http),label: 'Http'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      
        ),
        body: pages[_selectedIndex],
      ),
    );
  }
}

