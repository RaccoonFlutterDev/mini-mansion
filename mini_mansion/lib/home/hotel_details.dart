// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:shimmer/shimmer.dart';

class HotelDetails extends StatelessWidget {
  final String imageUrl;
  HotelDetails({super.key, required this.imageUrl});

  var isFavorite = false.obs;
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      alwaysShowLeadingAndAction: true,
      headerExpandedHeight: 0.35.h,
      curvedBodyRadius: 24.r,
      leading: Button(
        width: 25.w,
        height: 25.w,
        borderRadius: 25.r,
        widget: Icon(
          Icons.arrow_back_rounded,
          size: 18.sp,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: () {
          Get.back();
        },
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
      ),
      title: const SizedBox.shrink(),
      actions: [
        Obx(
          () {
            return Button(
              width: 25.w,
              height: 25.w,
              borderRadius: 25.r,
              widget: Icon(
                isFavorite.value
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                size: 18.sp,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onPressed: () {
                isFavorite.value = !isFavorite.value;
              },
              color:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
            );
          },
        ),
      ],
      headerWidget: headerWidget(context),
      body: const [],
      fullyStretchable: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarColor: Theme.of(context).primaryColor,
    );
  }

  Widget headerWidget(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Theme.of(context).cardColor,
            highlightColor: AppTheme.primary.withOpacity(0.5),
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Shimmer.fromColors(
            baseColor: Theme.of(context).cardColor,
            highlightColor: AppTheme.primary.withOpacity(0.5),
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
              ),
            ),
          ),
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
