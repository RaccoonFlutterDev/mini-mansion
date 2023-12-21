import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isDarkMode = false.obs;
SharedPreferences? prefs;
final Location location = Location();
late final FirebaseApp app;
late final FirebaseAuth auth;
var isLoggedIn = false.obs;
final RxList imageList = [].obs;

final enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.r),
  borderSide: BorderSide(
    width: 1.w,
    color: AppTheme.textHint,
  ),
);

final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.r),
  borderSide: BorderSide(
    width: 1.w,
    color: AppTheme.primary,
  ),
);
