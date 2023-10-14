// ignore_for_file: deprecated_member_use, use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/image_categories_model.dart';

class AddSpecificImagePopup extends StatelessWidget {
  final ImageCategoryModel category;
  const AddSpecificImagePopup({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            getImageFromGallery(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/gallery.svg',
                color: Theme.of(context).hintColor.withOpacity(0.5),
              ),
              Padding(
                padding: EdgeInsets.all(4.r),
                child: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
          child: VerticalDivider(
            color: Theme.of(context).hintColor,
            thickness: 2,
          ),
        ),
        TextButton(
          onPressed: () {
            getImageFromCamera(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/camera.svg',
                color: Theme.of(context).hintColor.withOpacity(0.5),
              ),
              Padding(
                padding: EdgeInsets.all(4.r),
                child: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> getImageFromGallery(context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Get.back();
      category.thumnail.value = pickedFile.path;
    }
  }

  Future<void> getImageFromCamera(context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Get.back();
      category.thumnail.value = pickedFile.path;
    }
  }
}
