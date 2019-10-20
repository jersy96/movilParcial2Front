class Time {
  final String time;
  final String country;

  Time({this.time, this.country});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      time: json['time'],
      country: json['country']
    );
  }
}
