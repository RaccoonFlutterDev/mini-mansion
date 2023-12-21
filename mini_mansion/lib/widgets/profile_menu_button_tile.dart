import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuButtonTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData leadingIcon;
  const ProfileMenuButtonTile(
      {super.key,
      required this.leadingIcon,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.only(left: 12.w, right: 8.w),
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).colorScheme.surface,
        size: 20.sp,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).colorScheme.surface,
        size: 16.sp,
      ),
    );
  }
}
