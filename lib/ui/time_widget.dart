import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../blocs/time_bloc.dart';
import '../models/time.dart';

class TimeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TimeWidgetState();
  }
}

class _TimeWidgetState extends State<TimeWidget> {
  final TimeBloc timeBloc = TimeBloc();

  @override
  void initState(){
    timeBloc.fetchTimeFromServer();
  }

  void updateTime(){
    timeBloc.fetchTimeFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Web services with flutter'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(

            image: AssetImage("assets/bg3.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<Time>(
                stream: timeBloc.time,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildTimeWidget(snapshot.data);

                  } else if (snapshot.hasError) {
                    return _buildErrorWidget(snapshot.error);
                  } else {
                    return _buildLoadingWidget();
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: updateTime,
        tooltip: 'Decrement',
        child: new Icon(Icons.date_range),
        backgroundColor: Colors.red
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Loading data from API...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22
          )
        ),
        CircularProgressIndicator()
      ]
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Error occured: $error",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22
          )
        ),
      ],
    ));
  }

  Widget _buildTimeWidget(Time data) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${data.time} en ${data.country}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22
              )
            ),
          ],
        ));
  }
}
