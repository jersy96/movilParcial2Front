import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:helloflutter/widgets/button_green.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title
  }) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController usernameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  dynamic token = "";
  void login() async {
    var username = usernameController.text;
    var pwd = pwdController.text;
    final response = await http.get('http://ec2-3-18-105-140.us-east-2.compute.amazonaws.com:3000/times');
    setState((){
      token = json.decode(response.body);
    });
  }

  void storeValue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', 'token');
  }

  void getValueStored() async {
    final prefs = await SharedPreferences.getInstance();
    setState((){
//      timeString = prefs.getString('token');
    });
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
              Text(token),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
              TextField(
                controller: pwdController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ButtonGreen(
                onPressed: login,
                    /*() {
                  Navigator.pushReplacementNamed(context, "/logout", arguments: ScreenArguments('Logged'));
                },*/
                text: 'Sign In',
                width: 100,
                height: 50,
              )
            ],
          ),

        ),
      ),
    );
  }

}
