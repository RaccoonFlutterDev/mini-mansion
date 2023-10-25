// ignore_for_file: constant_identifier_names


import 'package:get/get.dart';

enum ImageCategory {
  front,
  back,
  bedRoom,
  bathroom,
  kitchen,
  parking,
  terrace,
  others
}

class ImageCategoryModel {
  final ImageCategory category;
  var thumnail = ''.obs;

  ImageCategoryModel({
    required this.category,
    required this.thumnail,
  });
}
