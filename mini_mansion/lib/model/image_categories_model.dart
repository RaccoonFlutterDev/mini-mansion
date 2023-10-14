// ignore_for_file: constant_identifier_names


import 'package:get/get.dart';

enum ImageCategory {
  Front,
  Back,
  BedRoom,
  Bathroom,
  Kitchen,
  Parking,
  Terrace,
  Others
}

class ImageCategoryModel {
  final ImageCategory category;
  var thumnail = ''.obs;

  ImageCategoryModel({
    required this.category,
    required this.thumnail,
  });
}
