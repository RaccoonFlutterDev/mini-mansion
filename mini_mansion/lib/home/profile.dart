import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/auth/login_screen.dart';
import 'package:mini_mansion/auth/membership_registration.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:mini_mansion/controller/auth_controller.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:mini_mansion/widgets/profile_menu_button_tile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
                // auth.currentUser != null
                //     ? Column(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.all(8.r),
                //             child: CircleAvatar(
                //               radius: 50.r,
                //               backgroundImage: const NetworkImage(
                //                 'https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg',
                //               ),
                //             ),
                //           ),
                //           RichText(
                //             text: TextSpan(
                //               children: [
                //                 WidgetSpan(
                //                   alignment: PlaceholderAlignment.middle,
                //                   child: Text(
                //                     'Hello! ',
                //                     style:
                //                         Theme.of(context).textTheme.bodyLarge,
                //                   ),
                //                 ),
                //                 WidgetSpan(
                //                   alignment: PlaceholderAlignment.middle,
                //                   child: Text(
                //                     'Inamullah Shah',
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .headlineLarge,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       )
                //     : Button(
                //         width: Get.width * 0.75.w,
                //         widget: Text(
                //           'Sign in or Create an account',
                //           style: GoogleFonts.oxygen(
                //             color: AppTheme.textLight,
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //         onPressed: () {
                //           Get.to(
                //             LoginScreen(),
                //             transition: Transition.rightToLeft,
                //             duration: const Duration(
                //               milliseconds: 500,
                //             ),
                //           );
                //         },
                //         color: AppTheme.primary,
                //       ),
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // You can show a loading indicator here
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Handle errors
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final User? user = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          user != null
                              ? Column(
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
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Text(
                                              'Hello! Its me',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ),
                                          WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Text(
                                              user.displayName ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Button(
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
                          // ... rest of the profile UI ...
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 12.h),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.business_center_outlined,
                  onTap: () {},
                  title: 'My Bookings',
                ),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.payments_outlined,
                  onTap: () {},
                  title: 'Payment Settings',
                ),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.temple_buddhist_outlined,
                  onTap: () {
                    Get.to(
                      const MembershipRegistration(),
                      transition: Transition.downToUp,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                    );
                  },
                  title: 'List your Property',
                ),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.favorite_border_rounded,
                  onTap: () {},
                  title: 'Wish List',
                ),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.location_on_outlined,
                  onTap: () {},
                  title: 'Location',
                ),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.settings_outlined,
                  onTap: () {},
                  title: 'Settings',
                ),
                ProfileMenuButtonTile(
                    leadingIcon: Icons.help_outline_outlined,
                    onTap: () {},
                    title: 'Help Center'),
                ProfileMenuButtonTile(
                  leadingIcon: Icons.star_border_rounded,
                  onTap: () {},
                  title: 'Rate our app',
                ),
                ProfileMenuButtonTile(
                    leadingIcon: Icons.admin_panel_settings_outlined,
                    onTap: () {},
                    title: 'Privacy Policy'),
                auth.currentUser != null
                    ? ListTile(
                        onTap: () {
                          SocialAuth().signOut();
                        },
                        contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
                        leading: Icon(
                          Icons.logout_outlined,
                          color: Theme.of(context).colorScheme.surface,
                          size: 20.sp,
                        ),
                        title: Text(
                          'Logout',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: 79.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
