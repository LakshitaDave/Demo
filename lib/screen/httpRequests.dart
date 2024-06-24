import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'navbar.dart';

class User {
  final int id;
  final int userId;
  final String title;
  final String body;

  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}

class HttpRequest extends StatefulWidget {
  const HttpRequest({super.key});

  @override
  State<HttpRequest> createState() => _HttpRequestState();
}

class _HttpRequestState extends State<HttpRequest> {
  Future<List<User>> getData() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body);

    //print(data.id);
    List<User> users = [];
    for(var singleUser in data){
      User user = User(
        id: singleUser['id'],
        userId: singleUser['userId'],
        title: singleUser['title'],
        body: singleUser['body']

      );
      users.add(user);
    }
    print(users);
    return users;
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP requests'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const NavBar(),
      // body: FutureBuilder(
      //   future: getData(),
      //   builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
      //     if(snapshot.data == null){
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
          // else{
          //   return ListView.builder(
          //       itemBuilder: itemBuilder)
          // }
        // },

     // ),
    );
  }
}
