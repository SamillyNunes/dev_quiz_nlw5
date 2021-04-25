import 'package:dev_quiz/view/login/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  final ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);
  bool get isLoading => loadingNotifier.value;
  set isLoading(bool value) => loadingNotifier.value = value;

  final ValueNotifier<bool> loginNotifier = ValueNotifier<bool>(false);
  bool get isLoggedIn => loginNotifier.value;
  set isLoggedIn(bool value) => loginNotifier.value = value;

  String? name;
  String? profileUrl;

  Future<bool> signIn({required BuildContext context}) async {
    this.isLoading = true;

    try {
      await Authentication.initializeFirebase();

      User? user = await Authentication.signInWithGoogle(context);

      if (user != null) {
        name = user.displayName;
        profileUrl = user.photoURL;
      }

      print("user name on authentication: ${user!.displayName}");

      this.isLoggedIn = true;
      this.isLoading = false;
      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.messageSnackBar(
          message: "Um erro ocorreu. Tente novamente.",
        ),
      );
    }

    this.isLoading = false;
    return false;
  }

  Future<bool> signOut({required BuildContext context}) async {
    this.isLoading = true;

    try {
      Authentication.signOut(context: context);
      this.name = null;
      this.profileUrl = null;
      this.isLoggedIn = false;
      this.isLoading = false;
      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.messageSnackBar(
          message: "Um erro ocorreu. Tente novamente.",
        ),
      );
    }

    this.isLoading = false;
    return false;
  }
}
