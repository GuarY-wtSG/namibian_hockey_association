import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nho_app/pages/landing.dart';
import 'package:nho_app/pages/service/database.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  SignInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result != null) {
      Map<String, dynamic> userInforMap = {
        "email": userDetails!.email,
        "id": userDetails.uid,
        "name": userDetails.displayName,
        "photoUrl": userDetails.photoURL,
      };
      await DatabaseMethods().addUser(userDetails.uid, userInforMap).then((
        value,
      ) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Landing()),
        );
      });
    }
  }
}
