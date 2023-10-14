import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/bottom_sheet.dart';
import 'package:mini_mansion/widgets/upload_images/add_image.dart';
import 'package:mini_mansion/widgets/upload_images/add_specific_image.dart';

import '../../model/image_categories_model.dart';

class ImagesList extends StatefulWidget {
  final Map<String, dynamic> bodyData;
  const ImagesList({super.key, required this.bodyData});

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  List<ImageCategoryModel> imageCategories = [
    ImageCategoryModel(
      category: ImageCategory.Me,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Friend,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Partner,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Kid,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Mom,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Dad,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Sister,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Brother,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Colleague,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
    ImageCategoryModel(
      category: ImageCategory.Others,
      isSelected: false.obs,
      thumnail: ''.obs,
    ),
  ].obs;

  @override
  Widget build(BuildContext context) {
    List<GlobalKey> keys = <GlobalKey>[];
    for (var i = 0; i < imageCategories.length; i++) {
      keys.add(GlobalKey());
    }
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
                        bodyData: const {},
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
                    onLongPress: imageCategories[index - 1].thumnail.value != ''
                        ? () {
                            // Functions.showLongPressMenu(
                            //   context,
                            //   imageCategories[index - 1],
                            //   keys[index - 1],
                            //   index - 1,
                            // );
                          }
                        : () {},
                    onTap: imageCategories[index - 1].thumnail.value != ''
                        ? () {
                            for (var element in imageCategories) {
                              element.isSelected.value = false;
                            }
                            imageCategories[index - 1].isSelected.value = true;
                          }
                        : () {
                            showBlurredBarBottomSheet(
                              backgroundColor: Theme.of(context)
                                  .bottomSheetTheme
                                  .backgroundColor,
                              builder: (BuildContext context) {
                                return AddSpecificImagePopup(
                                  category: imageCategories[index - 1].category,
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
                                key: keys[index - 1],
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Theme.of(context).cardColor,
                                  border: Border.all(
                                    color: imageCategories[index - 1]
                                                .isSelected
                                                .value ==
                                            true
                                        ? AppTheme.primary
                                        : AppTheme.transparent,
                                    width: 2,
                                  ),
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
