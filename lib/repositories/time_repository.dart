import '../models/time.dart';
import '../providers/time_api_provider.dart';

class TimeRepository{
  TimeApiProvider _timeApiProvider = TimeApiProvider();

  Future<Time> fetchTimeFromServer(){
    return _timeApiProvider.fetchTime();
  }
}