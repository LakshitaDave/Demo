import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP requests'),
        centerTitle: true,
      ),
      body: Container(

      ),
    );
  }
}
