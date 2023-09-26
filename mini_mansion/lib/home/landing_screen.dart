import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:shimmer/shimmer.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://live.staticflickr.com/5766/24052713175_10cd1831e5_b.jpg',
            width: Get.width,
            height: Get.height,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Theme.of(context).cardColor,
              highlightColor: AppTheme.primary.withOpacity(0.5),
              enabled: true,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: Get.width.w,
                    height: (Get.height * 0.5).h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 1,
                          spreadRadius: 1,
                          color:
                              Theme.of(context).shadowColor.withOpacity(0.25),
                        )
                      ],
                    ),
                    child: Column(children: [],),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
