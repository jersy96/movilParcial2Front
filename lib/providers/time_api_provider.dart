import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/time.dart';

class TimeApiProvider{
  Future<Time> fetchTime() async {
    final response =
        await http.get('http://192.168.1.7:3000/times');
    if (response.statusCode == 200) {
      return Time.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Time');
    }
  }
}
