// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/controller/auth_controller.dart';
import 'package:mini_mansion/widgets/button.dart';
import 'package:mini_mansion/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var isVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.surface,
            size: 18.sp,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: TextFormField(
                cursorColor: AppTheme.primary,
                keyboardType: TextInputType.name,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'example@mail.com',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: AppTheme.textHint,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: AppTheme.textHint,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Password',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Obx(() {
                return TextFormField(
                  obscureText: isVisible.value,
                  obscuringCharacter: '*',
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: isVisible.value ? '********' : 'password',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    alignLabelWithHint: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible.value
                            ? Icons.lock_outline_rounded
                            : Icons.lock_open_rounded,
                        color: Theme.of(context).colorScheme.surface,
                        size: 18.sp,
                      ),
                      onPressed: () {
                        isVisible.value = !isVisible.value;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.textHint,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Text(
                  'Forget Password?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Button(
                width: Get.width * 0.5.w,
                widget: Text(
                  'Sign In',
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
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.oxygen(
                            color: AppTheme.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Divider(
                    endIndent: 10.w,
                    indent: 10.w,
                    thickness: 0.5.sp,
                    color: AppTheme.textHint.withOpacity(0.5),
                  ),
                ),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Flexible(
                  flex: 1,
                  child: Divider(
                    endIndent: 10.w,
                    indent: 10.w,
                    thickness: 0.5.sp,
                    color: AppTheme.textHint.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialLoginButton(
                      icon: Icon(
                        Icons.facebook,
                        color: AppTheme.textLight,
                        size: 24.sp,
                      ),
                      title: Text(
                        'Continue With Facebook',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: AppTheme.textLight,
                        ),
                      ),
                      onPressed: () async {
                        await SocialAuth.signInWithFacebook();
                      },
                      color: const Color(0xFF487ae1),
                    ),
                    SocialLoginButton(
                      icon: SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 24.w,
                      ),
                      title: Text(
                        'Continue With Google',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: AppTheme.textDark,
                        ),
                      ),
                      onPressed: () async {
                        await SocialAuth.signInWithGoogle();
                      },
                      color: const Color(0xFFFFFFFF),
                    ),
                    if (Platform.isIOS)
                      SocialLoginButton(
                        icon: Icon(
                          Icons.apple_outlined,
                          color: AppTheme.textLight,
                          size: 24.sp,
                        ),
                        title: Text(
                          'Continue With Apple',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            color: AppTheme.textLight,
                          ),
                        ),
                        onPressed: () async {
                          await SocialAuth.signInWithApple();
                        },
                        color: const Color(0xFF000000),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
