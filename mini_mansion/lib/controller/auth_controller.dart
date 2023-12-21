import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_mansion/model/auth_model.dart';

import 'firebase/firestore_crud.dart';

class SocialAuth extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoggedIn = false.obs;

  Future<void> checkAuthStatus() async {
    User? user = _auth.currentUser;
    if (user != null) {
      isLoggedIn.value = true;
    }
  }

  Future<void> signUpWithEmail({required Map<String, dynamic> body}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: body['email'],
        password: body['password'],
      );
      User? user = userCredential.user;
      var uid = user?.uid;
      if (user != null && uid != null) {
        AuthModel authModel = AuthModel(
          name: body['username'],
          email: body['email'],
          phoneNo: body['phone_no'],
          uid: uid,
        );
        await FirebaseCRUD(collectionPath: 'users')
            .create(body: authModel.toJson());
        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Success!',
              style: Get.context!.textTheme.titleMedium,
            ),
            messageText: Text(
              'Successfully Register',
              style: Get.context!.textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(
                'assets/icons/congratulation.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Colors.grey.shade100,
              )
            ],
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Error!!!',
              style: Get.context!.textTheme.titleMedium,
            ),
            messageText: Text(
              'Failed to Register',
              maxLines: 2,
              style: Get.context!.textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(
                'assets/icons/warning.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Colors.grey.shade100,
              )
            ],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!!!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            '$e',
            maxLines: 2,
            style: Get.context!.textTheme.bodyMedium,
          ),
          mainButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              'assets/icons/warning.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
          shouldIconPulse: true,
          snackStyle: SnackStyle.GROUNDED,
          boxShadows: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0.5,
              color: Colors.grey.shade100,
            )
          ],
          duration: const Duration(seconds: 2),
        ),
      );
      rethrow;
    }
  }

// Login function
  Future<void> signInWithEmail({required Map<String, dynamic> body}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: body['email'],
        password: body['password'],
      );
      User? user = userCredential.user;
      if (user != null) {
        isLoggedIn.value = true;
        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Success!',
              style: Get.context!.textTheme.titleMedium,
            ),
            messageText: Text(
              'Successfully Login',
              style: Get.context!.textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(
                'assets/icons/congratulation.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Colors.grey.shade100,
              )
            ],
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Error!!!',
              style: Get.context!.textTheme.titleMedium,
            ),
            messageText: Text(
              'Failed to Login',
              maxLines: 2,
              style: Get.context!.textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(
                'assets/icons/warning.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Colors.grey.shade100,
              )
            ],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!!!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            '$e',
            maxLines: 2,
            style: Get.context!.textTheme.bodyMedium,
          ),
          mainButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              'assets/icons/warning.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
          shouldIconPulse: true,
          snackStyle: SnackStyle.GROUNDED,
          boxShadows: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0.5,
              color: Colors.grey.shade100,
            )
          ],
          duration: const Duration(seconds: 2),
        ),
      );
      rethrow;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    isLoggedIn = false.obs;
  }
}
