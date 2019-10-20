import '../models/time.dart';
import '../repositories/time_repository.dart';
import 'package:rxdart/rxdart.dart';

class TimeBloc {
  final TimeRepository _timeRepository = TimeRepository();
  final BehaviorSubject<Time> _subject =
      BehaviorSubject<Time>();

  void fetchTimeFromServer() async {
    Time response = await _timeRepository.fetchTimeFromServer();
    _subject.sink.add(response);
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<Time> get subject => _subject;
  
}