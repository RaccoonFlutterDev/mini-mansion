// To parse this JSON data, do
//
//     final membershipModel = membershipModelFromJson(jsonString);

import 'dart:convert';

MembershipModel membershipModelFromJson(String str) =>
    MembershipModel.fromJson(json.decode(str));

String membershipModelToJson(MembershipModel data) =>
    json.encode(data.toJson());

class MembershipModel {
  String uid;
  String propertyType;
  String accommodates;
  String bedrooms;
  String streetAddress;
  String country;
  String city;
  String state;
  String zipCode;
  String ownerName;
  String nameYourProperty;
  String describeYourPlace;
  String guestsGetYourProperty;
  List<String> recommended;
  List<String> standard;
  List<String> kitchen;
  List<String> bathroom;
  List<String> safetyAndClean;
  List<String> other;
  String nightlyPrice;
  String weeklyOff;
  String weeklyPerNight;
  String monthlyOff;
  String monthlyPerNight;

  MembershipModel({
    required this.uid,
    required this.propertyType,
    required this.accommodates,
    required this.bedrooms,
    required this.streetAddress,
    required this.country,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.ownerName,
    required this.nameYourProperty,
    required this.describeYourPlace,
    required this.guestsGetYourProperty,
    required this.recommended,
    required this.standard,
    required this.kitchen,
    required this.bathroom,
    required this.safetyAndClean,
    required this.other,
    required this.nightlyPrice,
    required this.weeklyOff,
    required this.weeklyPerNight,
    required this.monthlyOff,
    required this.monthlyPerNight,
  });

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      MembershipModel(
        uid: json['uid'],
        propertyType: json["propertyType"],
        accommodates: json["accommodates"],
        bedrooms: json["bedrooms"],
        streetAddress: json["streetAddress"],
        country: json["country"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        ownerName: json["ownerName"],
        nameYourProperty: json["nameYourProperty"],
        describeYourPlace: json["describeYourPlace"],
        guestsGetYourProperty: json["guestsGetYourProperty"],
        recommended: List<String>.from(json["recommended"].map((x) => x)),
        standard: List<String>.from(json["standard"].map((x) => x)),
        kitchen: List<String>.from(json["kitchen"].map((x) => x)),
        bathroom: List<String>.from(json["bathroom"].map((x) => x)),
        safetyAndClean: List<String>.from(json["safetyAndClean"].map((x) => x)),
        other: List<String>.from(json["other"].map((x) => x)),
        nightlyPrice: json["nightlyPrice"],
        weeklyOff: json["weeklyOff"],
        weeklyPerNight: json["weeklyPerNight"],
        monthlyOff: json["monthlyOff"],
        monthlyPerNight: json["monthlyPerNight"],
      );

  Map<String, dynamic> toJson() => {
        "uid":uid,
        "propertyType": propertyType,
        "accommodates": accommodates,
        "bedrooms": bedrooms,
        "streetAddress": streetAddress,
        "country": country,
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "ownerName": ownerName,
        "nameYourProperty": nameYourProperty,
        "describeYourPlace": describeYourPlace,
        "guestsGetYourProperty": guestsGetYourProperty,
        "recommended": List<dynamic>.from(recommended.map((x) => x)),
        "standard": List<dynamic>.from(standard.map((x) => x)),
        "kitchen": List<dynamic>.from(kitchen.map((x) => x)),
        "bathroom": List<dynamic>.from(bathroom.map((x) => x)),
        "safetyAndClean": List<dynamic>.from(safetyAndClean.map((x) => x)),
        "other": List<dynamic>.from(other.map((x) => x)),
        "nightlyPrice": nightlyPrice,
        "weeklyOff": weeklyOff,
        "weeklyPerNight": weeklyPerNight,
        "monthlyOff": monthlyOff,
        "monthlyPerNight": monthlyPerNight,
      };
}
