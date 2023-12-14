import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:mini_mansion/controller/firebase/firestore_crud.dart';
import 'package:mini_mansion/model/membership_model.dart';

class MembershipController {
  static Future<void> addMembershipData(
      {required Map<String, dynamic> body}) async {
    try {
      // UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      //   email: body['email'],
      //   password: body['password'],
      // );
      // User? user = userCredential.user;
      // var uid = user?.uid;
      var uid = auth.currentUser?.uid;
      if (uid != null) {
        MembershipModel membershipModel = MembershipModel.fromJson(body);
        await FirebaseCRUD(collectionPath: 'membership')
            .create(body: membershipModel.toJson());
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
}
