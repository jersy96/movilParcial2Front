import 'dart:async';

import '../models/time.dart';
import '../repositories/time_repository.dart';

class TimeBloc {
  final TimeRepository _timeRepository = TimeRepository();
  final _timeController = StreamController<Time>();

  void fetchTimeFromServer() async {
    Time response = await _timeRepository.fetchTimeFromServer();
    _timeController.sink.add(response);
  }

  void dispose() {
    _timeController.close();
  }

  Stream<Time> get time => _timeController.stream;
}