import 'dart:async';

import 'package:flutter/material.dart';
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
  Future<Time> time;
  String timeString = '';
  TimeRepository _timeRepository = TimeRepository();

  void updateTime(){
    time = _timeRepository.fetchTimeFromServer();
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(timeString),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child:
                    const Text('Login', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),

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