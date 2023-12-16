import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:http/http.dart' as http;

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


   static Future<Map<String, dynamic>> fetchLocationFromPlaceId(
      String placeId, String apiKey) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data['result']['geometry']['location'];
      return location;
    } else {
      throw Exception('Failed to fetch location');
    }
  }
}

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
