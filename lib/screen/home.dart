import 'dart:io';

import 'package:demo/screen/navbar.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cnt=0;
  List<String> names = ['hello','i am'];
  List arrColors = [Colors.blue,Colors.amber,Colors.grey,Colors.lightBlueAccent,Colors.brown];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  final v = Platform.isWindows ? Colors.grey: Colors.lightBlueAccent;

  Future _showBackDialog() {
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Confirm"),
            content: const Text('Do you want to exit the app?'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context,false);
              }, child: const Text("Continue")
              ),

              TextButton(onPressed: (){
                Navigator.pop(context,true);
              }, child: const Text("Leave")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[100],
          appBar: AppBar(
            title: const Text("Demo App"),
            centerTitle: true,
            backgroundColor: v,
            automaticallyImplyLeading: false,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),

          drawer: NavBar(),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              setState(() {
                cnt++;
              });
            },
            child: const Icon(Icons.add),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                        //backgroundColor: Colors.blue,
                        radius: 40.0,
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      color: Colors.grey,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/tab');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>  const SecondScreen(
                            //         name: ' Back to home!!',
                            //         description : "First time navigated",
                            //       )),
                            // );
                          },
                          child: const Text("Next", style: TextStyle(fontSize: 30.0),)),
                    ),
                    PopScope(
                        canPop: false,
                        onPopInvoked:(bool didPop) async{
                          if(didPop)return;
                          final bool shouldPop = await _showBackDialog() ?? false;
                          if(context.mounted && shouldPop){
                            Navigator.pop(context);
                          }
                        },
                        child: TextButton(onPressed: () async {
                                final bool shouldPop = await _showBackDialog() ?? false;
                                if (context.mounted && shouldPop) {
                                  Navigator.pop(context);
                                }
                              },
                                  child: const Text('Back')),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Contact"),
                      subtitle: Text("396348934"),
                      trailing: Icon(Icons.map),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(names[index]);
                      },
                      itemCount: names.length,
                      itemExtent: 50.0,
                    ),
                    Container(
                      height: 400,
                      width: 300,
                      child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext context, int index){
                        return Container(color: arrColors[index],);
                      },
                        itemCount: arrColors.length,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Text(
                      '$cnt',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        //letterSpacing: 2.0,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        print("pressed");
                      },
                      child: Stack(

                        children: [
                          Image.asset(
                            'assets/ss.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 10.0,
                        child: Text(
                          'HELLO'
                          ,

                        ),

                      ),
                    ),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: "AGE",
                        hintText: 'Enter Age',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.clear),
                        filled: true,
                        border: OutlineInputBorder(),
                        //labelStyle: (),
                      ),
                      //keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      //onSubmitted: ,
                    ),
                    const SizedBox(height: 15.0,),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (String? value){
                          if(value!.length < 3) {
                            return "Enter password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,

                        decoration:  const InputDecoration(
                          labelText: "Password",
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.clear),
                          filled: true,
                          border: OutlineInputBorder(),

                        ),
                      ),),
                    ElevatedButton(
                        onPressed: (){
                          print(_controller.text);
                          setState(() {
                            print(_formKey.currentState!.validate().toString());
                          });
                        }, child: Text(
                      _controller.text,
                    )),
                    const Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontFamily: 'SpicyRice',
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Lakshita",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        letterSpacing: 2.0,
                        fontFamily: 'SpicyRice',
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Height",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontFamily: 'SpicyRice',
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "5.5",
                      style: TextStyle(
                        color: Colors.amberAccent,
                        letterSpacing: 2.0,
                        fontFamily: 'SpicyRice',
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          "lks@gmail.com",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                          ),
                        ),

                      ],
                    ),
                    ElevatedButton(
                        child: const Text('showBottomSheet'),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder:  (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.amber,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                          'Hello from Modal  Bottom Sheet'),
                                      ElevatedButton(
                                        child: const Text('Close BottomSheet'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    ),
                  ]
              ),
            ),
          ),
        ),

    );
  }
}


