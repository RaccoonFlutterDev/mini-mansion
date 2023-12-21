import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/controller/app_controller.dart';
import 'package:mini_mansion/home/favorites.dart';
import 'package:mini_mansion/home/profile.dart';

import 'home.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({
    super.key,
  });

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  var pages = [].obs;

  var currentIndex = 1.obs;
  @override
  void initState() {
    pages = [
      const FavoritesScreen(),
      MyHomePage(
      
      ),
      const MyProfile(),
    ].obs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () {
          return pages[currentIndex.value];
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Obx(() {
        return Container(
          margin: EdgeInsets.all(8.w),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 0.25,
                color: Theme.of(context).shadowColor.withOpacity(0.25),
              )
            ],
          ),
          child: FlashyTabBar(
            height: 55.h,
            iconSize: 20.sp,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedIndex: currentIndex.value,
            showElevation: false,
            onItemSelected: (index) => currentIndex.value = index,
            items: [
              FlashyTabBarItem(
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).hintColor,
                icon: const Icon(Icons.favorite_outline_outlined),
                title: const Text('Favorites'),
              ),
              FlashyTabBarItem(
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).hintColor,
                icon: const Icon(Icons.search),
                title: const Text('Explore'),
              ),
              FlashyTabBarItem(
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).hintColor,
                icon: const Icon(
                  Icons.person_3_outlined,
                ),
                title: const Text('Profile'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
