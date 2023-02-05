import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  String? uid = "";
  String? email = "";
  String? displayName = "";
  String? photoUrl = "";

  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  void signInWithGoogle() async {
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
    final authResult =
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

    uid = authResult.user?.uid;
    email = authResult.user?.email;
    displayName = authResult.user?.displayName;
    photoUrl = authResult.user?.photoURL;
    notifyListeners();
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
