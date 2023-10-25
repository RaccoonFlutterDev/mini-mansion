import 'dart:convert';

PropertyLocationModel propertyLocationModelFromJson(String str) =>
    PropertyLocationModel.fromJson(json.decode(str));

String propertyLocationModelToJson(PropertyLocationModel data) =>
    json.encode(data.toJson());

class PropertyLocationModel {
  final String uid;
  final String pid;
  final String street;
  final String country;
  final String city;
  final String state;
  int? zipCode;
  final String nearBy;
  final double lat;
  final double lang;

  PropertyLocationModel({
    required this.uid,
    required this.pid,
    required this.street,
    required this.country,
    required this.city,
    required this.state,
    this.zipCode,
    required this.nearBy,
    required this.lat,
    required this.lang,
  });

  factory PropertyLocationModel.fromJson(Map<String, dynamic> json) =>
      PropertyLocationModel(
        uid: json["uid"],
        pid: json["pid"],
        street: json["street"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        nearBy: json["near_by"],
        lat: json["lat"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "pid": pid,
        "street": street,
        "country": country,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "near_by": nearBy,
        "lat": lat,
        "lang": lang,
      };
}
