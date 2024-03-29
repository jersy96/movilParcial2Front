import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/time.dart';

class TimeApiProvider{
  Future<Time> fetchTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    final response = await http.get(
      'http://ec2-3-18-105-140.us-east-2.compute.amazonaws.com:3000/times',
      headers: {
        "Authorization": token
      }
    );
    if (response.statusCode == 200) {
      return Time.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Time');
    }
  }
}
