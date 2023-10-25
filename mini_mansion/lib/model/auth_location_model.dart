import 'dart:convert';

AuthLocationModel authLocationModelFromJson(String str) =>
    AuthLocationModel.fromJson(json.decode(str));

String authLocationModelToJson(AuthLocationModel data) =>
    json.encode(data.toJson());

class AuthLocationModel {
  final String uid;
  final String address;
  final double lat;
  final double lang;

  AuthLocationModel({
    required this.uid,
    required this.address,
    required this.lat,
    required this.lang,
  });

  factory AuthLocationModel.fromJson(Map<String, dynamic> json) =>
      AuthLocationModel(
        uid: json["uid"],
        address: json["address"],
        lat: json["lat"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "address": address,
        "lat": lat,
        "lang": lang,
      };
}
