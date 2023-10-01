import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';

class CategoryList extends StatelessWidget {
  final RxBool isSelected;
  final Widget thumbnail;
  final String title;
  final String value;
  const CategoryList({
    super.key,
    required this.isSelected,
    required this.thumbnail,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.w,
          color: isSelected.value == true
              ? Theme.of(context).primaryColor
              : AppTheme.textHint,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            thumbnail,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
