import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

var isDarkMode = false.obs;
SharedPreferences? prefs;
final Location location = Location();
late final FirebaseApp app;
late final FirebaseAuth auth;
var isLoggedIn = false.obs;
final RxList imageList = [].obs;

