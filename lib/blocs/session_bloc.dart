import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/session.dart' as s;
import '../repositories/session_repository.dart';

class SessionBloc {
  final SessionRepository _sessionRepository = SessionRepository();
  final _sessionController = StreamController<s.Session>();

  void login(Map<String, dynamic> params) async {
    s.Session response = await _sessionRepository.login(params);
    _storeToken(response.token);
  }

  void dispose() {
    _sessionController.close();
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void _storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Stream<s.Session> get session => _sessionController.stream;
}