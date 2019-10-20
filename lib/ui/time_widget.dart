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
  void initState() {
    super.initState();
    timeBloc.fetchTimeFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Time>(
      stream: timeBloc.subject.stream,
      builder: (context, AsyncSnapshot<Time> snapshot) {
        if (snapshot.hasData) {
          return _buildTimeWidget(snapshot.data);

        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data from API..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildTimeWidget(Time data) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${data.time} en ${data.country}"),
          ],
        ));
  }
}
