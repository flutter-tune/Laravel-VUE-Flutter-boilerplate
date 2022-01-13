import 'dart:convert';

class User {
  final int id;
  final String email;
  final String contactNo;

  User({
    required this.email,
    required this.id,
    required this.contactNo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['id'] as int,
      contactNo: json['contact_no'] as String,
    );
  }

  // A function that converts a response body into a List<Photo>.
  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
