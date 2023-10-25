import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/bottom_sheet.dart';
import 'package:mini_mansion/widgets/upload_images/add_image.dart';
import 'package:mini_mansion/widgets/upload_images/add_specific_image.dart';

import '../../model/image_categories_model.dart';

class ImagesList extends StatelessWidget {
  const ImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    var imageCategories = [
      ImageCategoryModel(
        category: ImageCategory.front,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.back,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.bedRoom,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.bedRoom,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.bedRoom,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.bathroom,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.kitchen,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.parking,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.terrace,
        thumnail: ''.obs,
      ),
      ImageCategoryModel(
        category: ImageCategory.others,
        thumnail: ''.obs,
      ),
    ].obs;
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageCategories.length + 1,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.all(8.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: () {
                  showBlurredBarBottomSheet(
                    backgroundColor:
                        Theme.of(context).bottomSheetTheme.backgroundColor,
                    builder: (BuildContext context) {
                      return AddImage(
                        imageContext: context,
                        imageCategories: imageCategories,
                      );
                    },
                    context: context,
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 55.w,
                      height: 55.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppTheme.primary,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 0.5,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppTheme.textLight,
                        size: 30.sp,
                      ),
                    ),
                    Text(
                      'Add Image',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        fontFamily: 'Poppins',
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Obx(
              () {
                return Padding(
                  padding: EdgeInsets.all(8.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {
                      showBlurredBarBottomSheet(
                        backgroundColor:
                            Theme.of(context).bottomSheetTheme.backgroundColor,
                        builder: (BuildContext context) {
                          return AddSpecificImagePopup(
                            category: imageCategories[index - 1],
                          );
                        },
                        context: context,
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        imageCategories[index - 1].thumnail.value != ''
                            ? Container(
                                width: 55.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Theme.of(context).cardColor,
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(imageCategories[index - 1]
                                          .thumnail
                                          .value),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      blurRadius: 2,
                                      spreadRadius: 0.5,
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                width: 55.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 0),
                                      blurRadius: 2,
                                      spreadRadius: 0.5,
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Theme.of(context).colorScheme.surface,
                                  size: 30.sp,
                                ),
                              ),
                        Text(
                          imageCategories[index - 1].category.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
