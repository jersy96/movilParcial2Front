import 'dart:async';

import 'package:flutter/material.dart';
import 'models/time.dart';
import 'providers/time_api_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Time> time;
  String timeString = '';
  TimeApiProvider _timeApiProvider = TimeApiProvider();

  void updateTime(){
    time = _timeApiProvider.fetchTime();
    time.then((Time t) => setState((){
      timeString = "${t.time} en ${t.country}";
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web services in flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Web services in flutter'),
        ),
        body: Center(
          child: Text(timeString)
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: updateTime,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}