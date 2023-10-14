import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/theme.dart';

import '../../model/image_categories_model.dart';

class WhoseFace extends StatelessWidget {
  final List<ImageCategoryModel> imageCategories;
  final File image;
  final Map<String, dynamic> bodyData;
  const WhoseFace(
      {super.key,
      required this.image,
      required this.bodyData,
      required this.imageCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            'Choose which category it is:',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Text(
            'This will help us to recommend more relevant content to you.',
            style: GoogleFonts.oxygen(
              color: AppTheme.textHint.withOpacity(0.75),
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageCategories.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(4.r),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  splashColor: AppTheme.primary.withOpacity(0.25),
                  onTap: () {},
                  child: Ink(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        width: 1,
                        color: AppTheme.primary,
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 0.25,
                          color: Colors.grey.withOpacity(0.25),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        imageCategories[index].category.name.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
