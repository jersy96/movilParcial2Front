import 'package:flutter/material.dart';
import 'package:helloflutter/MyHomePage.dart';
import 'package:helloflutter/models/time.dart';
import 'package:helloflutter/repositories/time_repository.dart';
import 'package:helloflutter/widgets/button_green.dart';

class ScreenArguments{
  final String title;
  ScreenArguments(this.title);
}

class MySecondPage extends StatefulWidget {
  MySecondPage(
      {Key key}
      ): super(key: key);
  @override
  _MySecondPageState createState() => new _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  Future<Time> time;
  String timeString = '';
  TimeRepository _timeRepository = TimeRepository();

  void onPressed() {
    // widget.decrementCounter(null);
  }

  void updateTime(){
    time = _timeRepository.fetchTimeFromServer();
    time.then((Time t) => setState((){
      timeString = "${t.time} en ${t.country}";
    }));
  }
  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(args.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(timeString),
            new Text('You have pushed the button this many times :'),
            new Text(
              'Hola',
              style: Theme.of(context).textTheme.display1,
            ),
            ButtonGreen(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              /*() {

                },*/
              text: 'Log Out',
              width: 100,
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: updateTime,
          tooltip: 'Decrement',
          child: new Icon(Icons.date_range),
          backgroundColor: Colors.red),
    );
  }
}