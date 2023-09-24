import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:shimmer/shimmer.dart';

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
      alwaysShowLeadingAndAction: true,
      headerExpandedHeight: 0.4.h,
      curvedBodyRadius: 24.r,
      leading: const Icon(Icons.menu_sharp),
      title: const SizedBox.shrink(),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      body: const [],
      fullyStretchable: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarColor: Theme.of(context).primaryColor,
    );
  }

  Widget headerWidget(BuildContext context) {
    return Stack(children: [
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
                  margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: currentSlide.value == entry.key
                        ? AppTheme.primary
                        : AppTheme.textHint,
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ),
    ]);
  }
}
