// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:shimmer/shimmer.dart';

class LargeCard extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final String imageUrl;

  LargeCard({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    this.borderRadius = 16,
    required this.color,
    required this.imageUrl,
  });

  var isFavorite = false.obs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(8.r),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 0.25,
              color: Theme.of(context).shadowColor.withOpacity(0.25),
            )
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                imageUrl: imageUrl,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Theme.of(context).cardColor,
                  highlightColor: AppTheme.primary.withOpacity(0.5),
                  enabled: true,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: color,
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
                      color: color,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Obx(
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
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.75),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                color: color,
                child: ListTile(
                  dense: true,
                  title: Text(
                    'Grand Royal Hotel',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wembley, Landon',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: PannableRatingBar.builder(
                                rate: 4.5,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return RatingWidget(
                                    selectedColor: AppTheme.primary,
                                    unSelectedColor: AppTheme.textHint,
                                    child: Icon(
                                      Icons.star,
                                      size: 18.sp,
                                    ),
                                  );
                                },
                              ),
                            ),
                            TextSpan(
                              text: ' 80 Reviews',
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '\$180',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Per Night',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MediumCard extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final String imageUrl;

  MediumCard({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    this.borderRadius = 16,
    required this.color,
    required this.imageUrl,
  });

  var isFavorite = false.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(8.r),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 0.25,
            color: Theme.of(context).shadowColor.withOpacity(0.25),
          )
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 100.w,
            height: 100.w,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Theme.of(context).cardColor,
              highlightColor: AppTheme.primary.withOpacity(0.5),
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: color,
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
                  color: color,
                ),
              ),
            ),
            fit: BoxFit.cover,
          ),
          Flexible(
            child: ListTile(
              dense: true,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Grand Royal Hotel',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'Wembley, Landon',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Icon(
                                  Icons.location_on,
                                  color: AppTheme.primary,
                                  size: 16.sp,
                                ),
                              ),
                              TextSpan(
                                text: ' 12km to City',
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          ),
                        ),
                        PannableRatingBar.builder(
                          rate: 4.5,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return RatingWidget(
                              selectedColor: AppTheme.primary,
                              unSelectedColor: AppTheme.textHint,
                              child: Icon(
                                Icons.star,
                                size: 18.sp,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$180',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Per Night',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
