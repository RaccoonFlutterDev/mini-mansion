// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:rating_summary/rating_summary.dart';
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
      leading: Padding(
        padding: EdgeInsets.all(8.r),
        child: Button(
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
      ),
      title: const SizedBox.shrink(),
      actions: [
        Obx(
          () {
            return Padding(
              padding: EdgeInsets.all(8.r),
              child: Button(
                width: 38.w,
                height: 38.w,
                borderRadius: 38.r,
                widget: Icon(
                  isFavorite.value
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  size: 18.sp,
                  color: AppTheme.textLight,
                ),
                onPressed: () {
                  isFavorite.value = !isFavorite.value;
                },
                color: Theme.of(context).primaryColor.withOpacity(0.75),
              ),
            );
          },
        ),
      ],
      headerWidget: headerWidget(context),
      body: [
        RatingSummary(
          counter: 13,
          color: AppTheme.primary,
          backgroundColor: AppTheme.textHint,
          average: 3.846,
          showAverage: true,
          counterFiveStars: 9,
          counterFourStars: 5,
          counterThreeStars: 6,
          counterTwoStars: 8,
          counterOneStars: 10,
          labelCounterFiveStars: 'Room',
          labelCounterFourStars: 'Service',
          labelCounterThreeStars: 'Location',
          labelCounterTwoStars: 'Price',
          labelCounterOneStars: 'Security',
          labelCounterFiveStarsStyle: Theme.of(context).textTheme.headlineMedium!,
          labelCounterFourStarsStyle: Theme.of(context).textTheme.headlineMedium!,
          labelCounterOneStarsStyle: Theme.of(context).textTheme.headlineMedium!,
          labelCounterThreeStarsStyle: Theme.of(context).textTheme.headlineMedium!,
          labelCounterTwoStarsStyle: Theme.of(context).textTheme.headlineMedium!,
          labelStyle: Theme.of(context).textTheme.headlineLarge!,
        )
      ],
      fullyStretchable: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarColor: Theme.of(context).primaryColor,
    );
  }

  Widget headerWidget(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: Get.height,
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
