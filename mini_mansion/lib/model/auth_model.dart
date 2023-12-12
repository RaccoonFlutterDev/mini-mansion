import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final String name;
  final String email;
  String? phoneNo;


  AuthModel({
    required this.name,
    required this.email,
    this.phoneNo,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        name: json["name"],
        email: json["email"],
        phoneNo: json["phone_no"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_no": phoneNo,
      };
}
