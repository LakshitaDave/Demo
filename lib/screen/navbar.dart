import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView(
              padding: EdgeInsets.zero,
              children:  [
                const DrawerHeader(
                    child:Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage('assets/profile.png'), radius: 40.0,
                                  ),
                               Text('DEMO',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)  ,
                      ],
                    ))
               ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.circle),
                  title: const Text("Screen 2"),
                  onTap: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/second');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.circle),
                  title: const Text("Screen 3 "),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/third');
                  },
                ),ListTile(
                  leading: const Icon(Icons.map_outlined),
                  title: const Text("Map "),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/google');
                  },
                ),

             ],
            ),
          ),
          const Divider(height: 10,color: Colors.grey,),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}
