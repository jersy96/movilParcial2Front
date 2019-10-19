import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Time {
  final String time;
  final String country;

  Time({this.time, this.country});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      time: json['time'],
      country: json['country']
    );
  }
}

Future<Time> fetchTime() async {
  final response =
      await http.get('http://ec2-3-18-105-140.us-east-2.compute.amazonaws.com:3000/times');
  if (response.statusCode == 200) {
    return Time.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Time');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Time> time;
  String timeString = '';

  void updateTime(){
    time = fetchTime();
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