import 'package:dev_quiz/core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // logica para autologin
    //
    return firebaseApp;
  }

  static Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    // inicializar as configuracoes do login da google
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // retorna o tipo GoogleSignIn caso tenha sucesso ou nulo se tiver sido abortado
    final googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      //pegando a autenticacao, ja que deu certo
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        // se autenticando no firebase
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (error) {
        if (error.code == 'account-exists-with-different-credential') {
          // handle the error here
          print("account-exists-with-different-credential");

          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.messageSnackBar(
              message:
                  "A conta existe, mas com credenciais diferentes. Tente novamente.",
            ),
          );
        } else if (error.code == 'invalid-credential') {
          // handle the error here
          print("invalid-credential");
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.messageSnackBar(
              message: "Credenciais inválidas. Tente novamente..",
            ),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.messageSnackBar(
            message: "Um erro ocorreu. Tente novamente.",
          ),
        );
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.messageSnackBar(
          message: "Um erro ocorreu. Tente novamente.",
        ),
      );
    }
  }

  static SnackBar messageSnackBar({required String message}) {
    return SnackBar(
      backgroundColor: AppColors.purple,
      content: Text(message),
    );
  }
}
