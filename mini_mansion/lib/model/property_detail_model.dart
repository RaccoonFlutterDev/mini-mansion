import 'dart:convert';

PropertyDetailModel propertyDetailModelFromJson(String str) =>
    PropertyDetailModel.fromJson(json.decode(str));

String propertyDetailModelToJson(PropertyDetailModel data) =>
    json.encode(data.toJson());

class PropertyDetailModel {
  final String uid;
  final String name;
  final String type;
  final int accommodation;
  final int bedrooms;
  final int bathrooms;
  String? description;
  List<Essiential>? essientials;
  double? ratings;

  PropertyDetailModel({
    required this.uid,
    required this.name,
    required this.type,
    required this.accommodation,
    required this.bedrooms,
    required this.bathrooms,
    this.description,
    this.essientials,
    this.ratings,
  });

  factory PropertyDetailModel.fromJson(Map<String, dynamic> json) =>
      PropertyDetailModel(
        uid: json["uid"],
        name: json["name"],
        type: json["type"],
        accommodation: json["accommodation"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        description: json["description"],
        essientials: List<Essiential>.from(
            json["essientials"].map((x) => Essiential.fromJson(x))),
        ratings: json["ratings"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "type": type,
        "accommodation": accommodation,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "description": description,
        "essientials": List<dynamic>.from(essientials!.map((x) => x.toJson())),
        "ratings": ratings,
      };
}

class Essiential {
  List<String>? recommended;
  List<String>? standard;
  List<String>? kitchen;
  List<String>? bathroom;
  List<String>? safety;
  List<String>? others;

  Essiential({
    this.recommended,
    this.standard,
    this.kitchen,
    this.bathroom,
    this.safety,
    this.others,
  });

  factory Essiential.fromJson(Map<String, dynamic> json) => Essiential(
        recommended: List<String>.from(json["recommended"].map((x) => x)),
        standard: List<String>.from(json["standard"].map((x) => x)),
        kitchen: List<String>.from(json["kitchen"].map((x) => x)),
        bathroom: List<String>.from(json["bathroom"].map((x) => x)),
        safety: List<String>.from(json["safety"].map((x) => x)),
        others: List<String>.from(json["others"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "recommended": List<dynamic>.from(recommended!.map((x) => x)),
        "standard": List<dynamic>.from(standard!.map((x) => x)),
        "kitchen": List<dynamic>.from(kitchen!.map((x) => x)),
        "bathroom": List<dynamic>.from(bathroom!.map((x) => x)),
        "safety": List<dynamic>.from(safety!.map((x) => x)),
        "others": List<dynamic>.from(others!.map((x) => x)),
      };
}
