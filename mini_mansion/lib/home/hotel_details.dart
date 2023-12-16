// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/model/membership_model.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:mini_mansion/widgets/cards.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class HotelDetails extends StatefulWidget {
  // final String imageUrl;
  final MembershipModel membershipModel;

  const HotelDetails({super.key, required this.membershipModel});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.4875103, 73.1008179),
    zoom: 16,
  );

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
            widget.membershipModel.nameYourProperty,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          subtitle: Text(
            '${widget.membershipModel.city}, ${widget.membershipModel.country}',
            maxLines: 1,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\$${widget.membershipModel.nightlyPrice}',
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
            widget.membershipModel.describeYourPlace,
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
        SizedBox(
          height: 116.w,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.membershipModel.hotelImages.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100.w,
                width: 100.w,
                margin: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.membershipModel.hotelImages[index]),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 0.25,
                      color: Theme.of(context).shadowColor.withOpacity(0.25),
                    )
                  ],
                ),
              );
            },
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
          padding: EdgeInsets.all(8.r),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return ReviewCard(
              onPressed: () {},
              color: Theme.of(context).scaffoldBackgroundColor,
              imageUrl:
                  'https://thumbs.dreamstime.com/b/close-up-photo-confident-serious-intelligent-clever-smart-man-staring-you-intently-new-eyewear-isolated-over-color-grey-161081282.jpg',
            );
          },
        ),
        Container(
          height: 200.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 0.25,
                color: Theme.of(context).shadowColor.withOpacity(0.25),
              )
            ],
          ),
          child: GoogleMap(
            mapType: MapType.terrain,
            markers: <Marker>{
              const Marker(
                markerId: MarkerId('home'),
                position: LatLng(33.4875103, 73.1008179),
              )
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Align(
            alignment: Alignment.center,
            child: Button(
              width: 250.w,
              height: 50.h,
              borderRadius: 8.r,
              color: AppTheme.primary,
              onPressed: () {},
              widget: Text(
                'Book Now',
                style: GoogleFonts.oxygen(
                  color: AppTheme.textLight,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
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
          imageUrl: widget.membershipModel.hotelImages[0],
          height: Get.height,
          width: Get.width,
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
