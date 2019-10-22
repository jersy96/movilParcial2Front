import '../models/session.dart';
import '../providers/session_api_provider.dart';

class SessionRepository{
  SessionApiProvider _sessionApiProvider = SessionApiProvider();

  Future<Session> login(Map<String, dynamic> params){
    return _sessionApiProvider.login(params);
  }
}