import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final VoidCallback onPressed;
  final Color color;
  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: SizedBox(
        width: Get.width * 0.65.w,
        height: 50.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            elevation: 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0.5,
                  color: Theme.of(context).shadowColor.withOpacity(0.15),
                )
              ],
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle, child: icon),
                    const TextSpan(text: ' '),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle, child: title),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
