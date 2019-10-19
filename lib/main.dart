import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          child: Text('Aqui va a ir la hora')
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}