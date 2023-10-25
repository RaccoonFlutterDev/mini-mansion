import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:mini_mansion/controller/firebase/firebase_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialAuth {
  static Future<UserCredential> signInWithGoogle(context) async {
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
      await FirebaseActions.addMail().then((value) {
        isLoggedIn.value = true;

        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Success!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            messageText: Text(
              'Successfully Login',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '🎉',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Theme.of(context).shadowColor,
              )
            ],
            duration: const Duration(seconds: 2),
          ),
        );
      });
    });
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<UserCredential> signInWithFacebook(context) async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .whenComplete(() async {
      await FirebaseActions.addMail().then((value) {
        isLoggedIn.value = true;

        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Success!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            messageText: Text(
              'Successfully Login',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '🎉',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Theme.of(context).shadowColor,
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

  static Future<UserCredential> signInWithApple(context) async {
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
      await FirebaseActions.addMail().then((value) {
        isLoggedIn.value = true;

        Get.back();
        Get.showSnackbar(
          GetSnackBar(
            titleText: Text(
              'Success!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            messageText: Text(
              'Successfully Login',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            mainButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                '🎉',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            shouldIconPulse: true,
            snackStyle: SnackStyle.GROUNDED,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0.5,
                color: Theme.of(context).shadowColor,
              )
            ],
            duration: const Duration(seconds: 2),
          ),
        );
      });
    });
  }
}
