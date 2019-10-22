import 'package:flutter/material.dart';
import 'package:helloflutter/MySecondPage.dart';
import 'package:helloflutter/models/time.dart';
import 'package:helloflutter/repositories/time_repository.dart';
import 'package:helloflutter/widgets/button_green.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.counter,
    this.decrementCounter,
    this.incrementCounter
  }) : super(key: key);
  final String title;
  final int counter;
  final ValueChanged<void> decrementCounter;
  final ValueChanged<void> incrementCounter;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
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
              ButtonGreen(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/logout", arguments: ScreenArguments('Logged'));
                },
                text: 'Ingresar',
                width: 100,
                height: 50,
              )
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
