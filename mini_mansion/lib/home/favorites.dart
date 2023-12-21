import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/controller/app_controller.dart';
import 'package:mini_mansion/home/hotel_details.dart';
import 'package:mini_mansion/model/membership_model.dart';
import 'package:mini_mansion/widgets/cards.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // final AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: controller.getFavMemberships.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.favorite_outline_outlined,
                    size: 48.sp,
                    color: AppTheme.textHint,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Favorite',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Text(
                      'To add a Favorite, tap the heart on any hotel profile or search for a hotel here.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: controller.getFavMemberships.length,
                itemBuilder: (context, index) {
                  // MembershipModel currentProperty =
                  //     controller.getFavMemberships[index];
            
                  return LargeCard(
                    onPressed: () {
                      Get.to(
                        HotelDetails(
                            membershipModel:
                                controller.getFavMemberships[index]),
                        transition: Transition.rightToLeft,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                      );
                    },
                    width: Get.width - 50.w,
                    height: 200.h,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    membershipModel: controller.getFavMemberships[index],
                    // imageUrl: ,
                  );
                }),
      );
    });
  }
}
