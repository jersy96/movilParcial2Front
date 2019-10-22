class Session {
  final String token;

  Session({this.token});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      token: json['token']
    );
  }
}
