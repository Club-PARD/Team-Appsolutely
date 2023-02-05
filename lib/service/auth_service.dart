import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');

  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  void signInWithGoogle({
    required Function onSuccess,
    required Function(String err) onError,
  }) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseAuth.instance.userChanges().listen((User? user) async {
        if (user != null) {
          await userCollection.doc(user.uid).set({
            'email': user.email,
            'uid': user.uid,
            'url': user.photoURL,
            'name': user.displayName,
          });
        }
      });

      onSuccess();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // firebase auth 에러 발생
      onError(e.message!);
    } catch (e) {
      // Firebase auth 이외의 에러 발생
      onError(e.toString());
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
