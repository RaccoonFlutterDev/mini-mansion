import 'dart:convert';

RoomsDetailModel roomsDetailModelFromJson(String str) =>
    RoomsDetailModel.fromJson(json.decode(str));

String roomsDetailModelToJson(RoomsDetailModel data) =>
    json.encode(data.toJson());

class RoomsDetailModel {
  final String uid;
  final String pid;
  final double pricePerNight;
  final double pricePerWeek;
  final double pricePerMonth;
  final List<Picture> pictures;

  RoomsDetailModel({
    required this.uid,
    required this.pid,
    required this.pricePerNight,
    required this.pricePerWeek,
    required this.pricePerMonth,
    required this.pictures,
  });

  factory RoomsDetailModel.fromJson(Map<String, dynamic> json) =>
      RoomsDetailModel(
        uid: json["uid"],
        pid: json["pid"],
        pricePerNight: json["price_per_night"],
        pricePerWeek: json["price_per_week"],
        pricePerMonth: json["price_per_month"],
        pictures: List<Picture>.from(
            json["pictures"].map((x) => Picture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "pid": pid,
        "price_per_night": pricePerNight,
        "price_per_week": pricePerWeek,
        "price_per_month": pricePerMonth,
        "pictures": List<dynamic>.from(pictures.map((x) => x.toJson())),
      };
}

class Picture {
  final String thumbnail;
  final String category;

  Picture({
    required this.thumbnail,
    required this.category,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        thumbnail: json["thumbnail"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "category": category,
      };
}
