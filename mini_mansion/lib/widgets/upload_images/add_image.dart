// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_mansion/widgets/bottom_sheet.dart';
import 'package:mini_mansion/widgets/upload_images/image_category.dart';

import '../../model/image_categories_model.dart';

class AddImage extends StatelessWidget {
  final List<ImageCategoryModel> imageCategories;
  final BuildContext imageContext;
  const AddImage({
    super.key,
    required this.imageContext,
    required this.imageCategories,
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
      showBlurredBarBottomSheet(
        backgroundColor:
            Theme.of(imageContext).bottomSheetTheme.backgroundColor,
        builder: (BuildContext context) {
          return WhoseFace(
            image: File(pickedFile.path),
            imageCategories: imageCategories,
          );
        },
        context: imageContext,
      );
    }
  }

  Future<void> getImageFromCamera(context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Get.back();
      showBlurredBarBottomSheet(
        backgroundColor:
            Theme.of(imageContext).bottomSheetTheme.backgroundColor,
        builder: (BuildContext context) {
          return WhoseFace(
            image: File(pickedFile.path),
            imageCategories: imageCategories,
          );
        },
        context: imageContext,
      );
    }
  }
}
