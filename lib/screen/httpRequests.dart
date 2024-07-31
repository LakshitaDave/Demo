import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import 'navbar.dart';

class User {
  late final int id;
  late final int userId;
  late final String title;
  late final String body;

  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  User.fromJson(Map<String,dynamic> json){

        id =  json['id'];
        userId =  json['userId'];
        title =  json['title'];
        body= json['body'];
  }
}

class HttpRequest extends StatefulWidget {
  const HttpRequest({super.key});

  @override
  State<HttpRequest> createState() => _HttpRequestState();
}

class _HttpRequestState extends State<HttpRequest> {

  User? user;
  bool isLoading = false;

  Future<Map<String,dynamic>> getData() async{
    isLoading=true;

    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var res = jsonDecode(response.body);

    if(response.statusCode==200 || response.statusCode==201) {
        isLoading=false;
        return res;
    }
    else{
      isLoading=false;

    }
    return {};
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

      body: Center(
        child: isLoading ? const CircularProgressIndicator()
         : user == null ? const Text('no data fetched') :
             ListTile(
                title: Text(user!.title),
                subtitle: Text(user!.body),
              )
            ),



    );
  }
}





//SINGLE USER DATA
//   var singleUser = data[0];
//   User user = User(
//       id: singleUser['id'],
//       userId: singleUser['userId'],
//       title: singleUser['title'],
//       body: singleUser['body']
//   );

//return user;

//LIST OF USERS
// List<User> users = [];
// for(var singleUser in data){
//   User user = User(
//     id: singleUser['id'],
//     userId: singleUser['userId'],
//     title: singleUser['title'],
//     body: singleUser['body']
//
//   );
//   users.add(user);
// }
// //print(users);
// return users;

//FutureBuilder(
//   future: getData(),
//   builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
//     if(snapshot.data == null){
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     else if(snapshot.hasData){
//       //return Text(snapshot.data!.body);
//       return ListView.builder(
//           itemBuilder: (context,index)=> ListTile(
//             title: Text(snapshot.data![index].title),
//             subtitle: Text(snapshot.data![index].body),
//
//           ));
//     }
//     else{
//       return Text('${snapshot.error}');
//     }
//   },