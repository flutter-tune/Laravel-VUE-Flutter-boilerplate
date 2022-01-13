import 'dart:convert';

class Prdoduct {
  final int id;
  final String email;
  final String contactNo;

  Prdoduct({
    required this.email,
    required this.id,
    required this.contactNo,
  });

  factory Prdoduct.fromJson(Map<String, dynamic> json) {
    return Prdoduct(
      email: json['email'],
      id: json['id'] as int,
      contactNo: json['contact_no'] as String,
    );
  }

  // A function that converts a response body into a List<Photo>.
  List<Prdoduct> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Prdoduct>((json) => Prdoduct.fromJson(json)).toList();
  }
}
