import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helloflutter/MyHomePage.dart';
import 'package:helloflutter/MySecondPage.dart';
import 'package:helloflutter/widgets/button_green.dart';
import 'models/time.dart';
import 'repositories/time_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
//Text(timeString)
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(
        title: 'My Home Page'
      ),
      routes: {
        "/logout": (context) => MySecondPage(),
      }
    );
  }

}

