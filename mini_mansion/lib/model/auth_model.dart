import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final String name;
  final String email;
  String? phoneNo;
  String? uid;


  AuthModel({
    required this.name,
    required this.email,
    this.phoneNo,
    this.uid
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        name: json["name"],
        email: json["email"],
        phoneNo: json["phone_no"],
        uid:json["uid"]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_no": phoneNo,
        "uid":uid
      };
}
