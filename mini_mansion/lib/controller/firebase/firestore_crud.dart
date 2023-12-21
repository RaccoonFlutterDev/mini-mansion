import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mini_mansion/constant/functions.dart';
import 'package:mini_mansion/model/membership_model.dart';

class FirebaseCRUD {
  final String collectionPath;
  FirebaseCRUD({required this.collectionPath});

// Create data in Firestore
  Future<void> create({required Map<String, dynamic> body}) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection(collectionPath);
    final refId = usersCollection.doc().id;    
    try {
      await usersCollection.doc(body["uid"]).set(body);
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Success!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            'Successfully Created',
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
    } catch (error) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!!!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            '$error',
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

// Read data from Firestore
  Future<List<Map<String, dynamic>>> get() async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection(collectionPath);
    try {
      final querySnapshot = await usersCollection.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList()
          as List<Map<String, dynamic>>;
    } catch (error) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!!!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            '$error',
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

// Update data in Firestore
  Future<void> update(
      {required Map<String, dynamic> body, required String id}) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection(collectionPath);
    try {
      await usersCollection.doc(id).update(body);
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Success!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            'Successfully Created',
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
    } catch (error) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!!!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            '$error',
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

// Delete data from Firestore
  Future<void> delete({required String id}) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection(collectionPath);
    try {
      await usersCollection.doc(id).delete();
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Success!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            'Successfully Created',
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
    } catch (error) {
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!!!',
            style: Get.context!.textTheme.titleMedium,
          ),
          messageText: Text(
            '$error',
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



