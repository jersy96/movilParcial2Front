import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/session.dart';

class SessionApiProvider{
  Future<Session> login(Map<String, dynamic> params) async {
    final response = await http.post(
      'http://ec2-3-18-105-140.us-east-2.compute.amazonaws.com:3000/sessions',
      body: params
    );
    if (response.statusCode == 200) {
      return Session.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed login');
    }
  }
}
