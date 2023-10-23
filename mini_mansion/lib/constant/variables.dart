import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isDarkMode = false.obs;
SharedPreferences? prefs;
final Location location = Location();
