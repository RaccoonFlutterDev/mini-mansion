import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_mansion/model/auth_location_model.dart';
import 'package:mini_mansion/model/auth_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
   Future<void> signInWithEmail(
      {required Map<String, dynamic> body}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: body['email'],
        password: body['password'],
      );
      User? user = userCredential.user;
      if (user != null) {
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

   Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() async {
      AuthModel authModel = AuthModel(
          name: auth.currentUser!.displayName!,
          email: auth.currentUser!.email!,
          phoneNo: auth.currentUser!.phoneNumber);
      await FirebaseCRUD(collectionPath: 'users')
          .create(body: authModel.toJson())
          .then((value) {
        isLoggedIn.value = true;

        Get.back();
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
      });
    });
  }

   Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    isLoggedIn = false.obs;
  }

   Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .whenComplete(() async {
      User user = auth.currentUser!;
      AuthModel authModel = AuthModel(
          name: user.displayName!,
          email: user.email!,
          phoneNo: user.phoneNumber);
      AuthLocationModel? authLocationModel;
      await location.getLocation().then((value) async {
        authLocationModel = AuthLocationModel(
            uid: user.uid,
            address: '',
            lat: value.latitude!,
            lang: value.longitude!);
      });
      await FirebaseCRUD(collectionPath: 'users')
          .create(body: authModel.toJson())
          .then((value) async {
        await FirebaseCRUD(collectionPath: 'users_location')
            .create(body: authLocationModel!.toJson());
        isLoggedIn.value = true;

        Get.back();
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
      });
    });
  }

  //iOS
  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

   Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await FirebaseAuth.instance
        .signInWithCredential(oauthCredential)
        .whenComplete(() async {
      AuthModel authModel = AuthModel(
          name: auth.currentUser!.displayName!,
          email: auth.currentUser!.email!,
          phoneNo: auth.currentUser!.phoneNumber);
      await FirebaseCRUD(collectionPath: 'users')
          .create(body: authModel.toJson())
          .then((value) {
        isLoggedIn.value = true;

        Get.back();
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
      });
    });
  }
}
