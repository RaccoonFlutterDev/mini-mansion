import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_mansion/constant/functions.dart';
import 'package:mini_mansion/constant/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/variables.dart';
import 'home/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  await ScreenUtil.ensureScreenSize();
  prefs = await SharedPreferences.getInstance();
  await Functions.checkPermissions();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppTheme.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Mini Mansion',
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            scaffoldBackgroundColor: AppTheme.backgroundLight,
            hintColor: AppTheme.textHint,
            primaryColor: AppTheme.primary,
            primarySwatch: AppTheme.primarySwatch,
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.oxygen(
                color: AppTheme.textDark,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              headlineMedium: GoogleFonts.oxygen(
                color: AppTheme.textDark,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              headlineSmall: GoogleFonts.oxygen(
                color: AppTheme.textDark,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: GoogleFonts.oxygen(
                color: AppTheme.textDark,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              bodyMedium: GoogleFonts.oxygen(
                color: AppTheme.textDark,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              bodySmall: GoogleFonts.oxygen(
                color: AppTheme.textDark,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              labelLarge: GoogleFonts.oxygen(
                color: AppTheme.textHint,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              labelMedium: GoogleFonts.oxygen(
                color: AppTheme.textHint,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              labelSmall: GoogleFonts.oxygen(
                color: AppTheme.textHint,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppTheme.primary,
              tertiary: AppTheme.textDark,
              surface: AppTheme.textDark,
            ),
          ),
          home: const MyDashboard(),
        );
      },
    );
  }
}
