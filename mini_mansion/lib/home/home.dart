import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/cards.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentSlide = 0.obs;
  var sliderImages = [].obs;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    sliderImages.value = [
      'https://e0.pxfuel.com/wallpapers/951/799/desktop-wallpaper-hotel-room-bed-furniture-luxury-widescreen-16-9-background-hotel-room.jpg',
      'https://images6.alphacoders.com/329/329921.jpg',
      'https://img.freepik.com/free-photo/luxury-modern-style-bedroom-interior-hotel-bedroom-generative-ai-illustration_1258-151610.jpg',
      'https://img.freepik.com/premium-photo/light-generative-ai-luxurious-hotel-room_28914-16061.jpg'
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      alwaysShowLeadingAndAction: false,
      headerExpandedHeight: 0.35.h,
      curvedBodyRadius: 24.r,
      leading: const Icon(Icons.search),
      title: const SizedBox.shrink(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.tune,
          ),
        ),
      ],
      headerWidget: headerWidget(context),
      body: bodyWidget(context),
      fullyStretchable: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarColor: Theme.of(context).primaryColor,
    );
  }

  Widget headerWidget(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: Get.height,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              currentSlide.value = index;
            },
          ),
          items: sliderImages.map((i) {
            return CachedNetworkImage(
              imageUrl: i,
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
            );
          }).toList(),
        ),
        Positioned(
          top: 50.h,
          right: 16.w,
          left: 16.w,
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    hintText: 'Where are you going?',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Button(
                width: 40.w,
                height: 40.w,
                borderRadius: 40.r,
                color: AppTheme.primary,
                onPressed: () {},
                widget: const Icon(
                  Icons.tune,
                  color: AppTheme.textLight,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 32.h,
          right: 16.w,
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: sliderImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastOutSlowIn,
                    width: currentSlide.value == entry.key ? 24.w : 12.w,
                    height: 12.h,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0.25,
                          color:
                              Theme.of(context).shadowColor.withOpacity(0.25),
                        )
                      ],
                      color: currentSlide.value == entry.key
                          ? AppTheme.primary
                          : AppTheme.textLight,
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ),
      ],
    );
  }

  List<Widget> bodyWidget(BuildContext context) {
    return [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Near by',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: GoogleFonts.oxygen(
                    fontSize: 12.sp,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 200.h,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: sliderImages.length,
          itemBuilder: (context, index) {
            return LargeCard(
              onPressed: () {},
              width: Get.width - 50.w,
              height: 200.h,
              color: Theme.of(context).scaffoldBackgroundColor,
              imageUrl: sliderImages[index],
            );
          },
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best deals',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: GoogleFonts.oxygen(
                    fontSize: 12.sp,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 8.w,bottom: 79.h,left: 8.w,right: 8.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: sliderImages.length,
        itemBuilder: (context, index) {
          return MediumCard(
            onPressed: () {},
            width: Get.width,
            height: 100.h,
            color: Theme.of(context).scaffoldBackgroundColor,
            imageUrl: sliderImages[index],
          );
        },
      ),
    ];
  }
}
