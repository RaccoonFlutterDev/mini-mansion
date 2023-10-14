import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:mini_mansion/constant/variables.dart';

class Functions {
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

  static Future<List> loadCountries() async {
    List countries = [];
    String jsonData = await rootBundle.loadString('assets/json/countries.json');
    for (var element in jsonDecode(jsonData)) {
      countries.add(element['name']);
    }
    return countries;
  }

  static Future<List> loadCurrencies() async {
    List currencies;
    String jsonData =
        await rootBundle.loadString('assets/json/currencies.json');
    currencies = jsonDecode(jsonData);
    return currencies;
  }
}
