import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/auth/login_screen.dart';
import 'package:mini_mansion/auth/membership_registration.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/widgets/button.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const NetworkImage(
                      'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg',
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Text(
                          'Hello! ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Text(
                          'Inamullah Shah',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Button(
                  width: Get.width * 0.75.w,
                  widget: Text(
                    'Sign in or Create an account',
                    style: GoogleFonts.oxygen(
                      color: AppTheme.textLight,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Get.to(
                      LoginScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                    );
                  },
                  color: AppTheme.primary,
                ),
                SizedBox(height: 16.h),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.business_center_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'My Bookings',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.payments_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Payment Settings',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.to(
                      const MembershipRegistration(),
                      transition: Transition.downToUp,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.temple_buddhist_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'List your Property',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.favorite_border_rounded,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Wish List',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Location',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.help_outline_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Help Center',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.star_border_rounded,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Rate our app',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                  leading: Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Theme.of(context).colorScheme.surface,
                    size: 20.sp,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                    size: 16.sp,
                  ),
                ),
              SizedBox(height: 79.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
