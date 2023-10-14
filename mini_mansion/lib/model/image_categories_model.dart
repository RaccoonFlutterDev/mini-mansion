// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

enum ImageCategory {
  Me,
  Friend,
  Partner,
  Kid,
  Mom,
  Dad,
  Sister,
  Brother,
  Colleague,
  Others
}

class ImageCategoryModel {
  var isSelected = false.obs;
  ImageCategory category;
  var thumnail = ''.obs;

  ImageCategoryModel({
    required this.isSelected,
    required this.category,
    required this.thumnail,
  });
}
