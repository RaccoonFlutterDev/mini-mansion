import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/functions.dart';

import 'home.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> with WidgetsBindingObserver {
  var pages = [].obs;

  var currentIndex = 1.obs;
  @override
  void initState() {
    pages = [
      Container(
        width: Get.width,
        height: Get.height,
        color: Colors.amber,
      ),
      const MyHomePage(),
      Container(
        width: Get.width,
        height: Get.height,
        color: Colors.blue,
      ),
    ].obs;
    WidgetsBinding.instance.addObserver(this);
    Functions.updateStatusBarColor();
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    Functions.updateStatusBarColor();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return pages[currentIndex.value];
        },
      ),
      bottomNavigationBar: Obx(() {
        return FlashyTabBar(
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
              title: const Text('Trips'),
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
        );
      }),
    );
  }
}
