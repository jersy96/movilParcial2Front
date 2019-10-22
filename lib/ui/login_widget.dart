import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../ui/button_green.dart';
import '../blocs/session_bloc.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginWidgetState createState() => new _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  SessionBloc sessionBloc = SessionBloc();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  makeLogin() async{
    final progress = ProgressHUD.of(context);
    progress.show();
    await sessionBloc.login({
      'username': usernameController.text,
      'password': passwordController.text
    });
    progress.dismiss();
    Navigator.pushReplacementNamed(
      context,
      "/time_view"
    );
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
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg3.jpg"),
            fit: BoxFit.cover
          ),
        ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Usuario'
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                ButtonGreen(
                  onPressed: makeLogin,
                  text: 'Sign In',
                  width: 100,
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  dispose(){
    sessionBloc.dispose();
    super.dispose();
  }
}