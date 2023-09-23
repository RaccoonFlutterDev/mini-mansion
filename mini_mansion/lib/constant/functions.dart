import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/constant/variables.dart';

class Functions{
  static void updateStatusBarColor() {
    final Brightness brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    if (brightness == Brightness.dark) {
      isDarkMode.value = true;
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppTheme.transparent,
        statusBarIconBrightness: Brightness.light,
      ));
    } else {
      isDarkMode.value = false;
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppTheme.transparent,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }
}