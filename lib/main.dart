import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;
  static var visible = true;


  Future<Post> fetchPost() async {
    final response =
        await http.get('http://192.168.1.167:3000/users');

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
      // If the call to the server was successful, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMyPost();
  }

  void fetchMyPost() {
    setState((){
      post = fetchPost();
    });
  }

  final loading = Visibility(child: CircularProgressIndicator(), visible: visible,);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              loading,
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.body);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error} jajaja");
                  }
                },
              ),
            ],  
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchMyPost,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}