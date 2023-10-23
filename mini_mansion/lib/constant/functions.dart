import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:mini_mansion/constant/variables.dart';

class Functions {
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

  static Future<void> checkPermissions() async {
    await location.hasPermission().then((permission) async {
      if (permission != PermissionStatus.granted) {
        await location.requestPermission();
      }
    });
  }
}
