import 'package:flutter/material.dart';
import 'package:helloflutter/MyHomePage.dart';

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

  void onPressed() {
    // widget.decrementCounter(null);
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
            new Text('You have pushed the button this many times :'),
            new Text(
              'Hola',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          tooltip: 'Decrement',
          child: new Icon(Icons.indeterminate_check_box),
          backgroundColor: Colors.red),
    );
  }
}