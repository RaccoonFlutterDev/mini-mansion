// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/image_categories_model.dart';

class UpdateSpecificFacePopup extends StatefulWidget {
  final ImageCategory category;
  const UpdateSpecificFacePopup({super.key, required this.category});

  @override
  State<UpdateSpecificFacePopup> createState() =>
      _UpdateSpecificFacePopupState();
}

class _UpdateSpecificFacePopupState extends State<UpdateSpecificFacePopup> {
  File? image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      width: 328.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Theme.of(context).colorScheme.tertiaryContainer,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 2,
            color: Theme.of(context).shadowColor,
          )
        ],
      ),
      child: Row(
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
      ),
    );
  }

  Future<void> getImageFromGallery(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Navigator.of(context).pop();
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<void> getImageFromCamera(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Navigator.of(context).pop();
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
}
