// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:mini_mansion/widgets/cards.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:readmore/readmore.dart';
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
        ListTile(
          dense: true,
          title: Text(
            'Grand Royal Hotel',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          subtitle: Text(
            'Wembley, Landon',
            maxLines: 1,
            style: Theme.of(context).textTheme.labelSmall,
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
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Text(
              'Summary',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: ReadMoreText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            trimLines: 2,
            colorClickableText: AppTheme.primary,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
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
          labelCounterFiveStarsStyle:
              Theme.of(context).textTheme.headlineMedium!,
          labelCounterFourStarsStyle:
              Theme.of(context).textTheme.headlineMedium!,
          labelCounterOneStarsStyle:
              Theme.of(context).textTheme.headlineMedium!,
          labelCounterThreeStarsStyle:
              Theme.of(context).textTheme.headlineMedium!,
          labelCounterTwoStarsStyle:
              Theme.of(context).textTheme.headlineMedium!,
          labelStyle: Theme.of(context).textTheme.headlineLarge!,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rooms',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'View All ',
                          style: GoogleFonts.oxygen(
                            fontSize: 12.sp,
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppTheme.primary,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'View All ',
                          style: GoogleFonts.oxygen(
                            fontSize: 12.sp,
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppTheme.primary,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding:
              EdgeInsets.only(top: 8.w, bottom: 79.h, left: 8.w, right: 8.w),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (context, index) {
            return ReviewCard(
              onPressed: () {},
              color: Theme.of(context).scaffoldBackgroundColor,
              imageUrl:
                  'https://thumbs.dreamstime.com/b/close-up-photo-confident-serious-intelligent-clever-smart-man-staring-you-intently-new-eyewear-isolated-over-color-grey-161081282.jpg',
            );
          },
        ),
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
