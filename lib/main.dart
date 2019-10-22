import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'ui/login_widget.dart';
import 'ui/time_widget.dart';

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
      home: ProgressHUD(
        child: new LoginWidget(
          title: 'My Home Page'
        )
      ),
      routes: {
        "/time_view": (context) => ProgressHUD(child: TimeWidget()),
      }
    );
  }
}