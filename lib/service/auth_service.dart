import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends ChangeNotifier {
  final userCollection = FirebaseFirestore.instance.collection('user');
  static String verify = "";

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
          }).whenComplete(() => {print('저장 완료')});
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

  void signInWithPhoneNumber({
    required String phone,
    required Function onSuccess,
    required Function(String err) onError,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          onError(e.message!);
        },
        codeSent: (String verificationId, int? resendToken) {
          verify = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verify = verificationId;
        },
      );

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

  void checkPINCode({
    required String code,
    required Function onSuccess,
    required Function(String err) onError,
  }) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: code);

      // Sign the user in (or link) with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

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

  void checkPINCodeSignUp({
    required String code,
    required String name,
    required String birthDay,
    required Function onSuccess,
    required Function(String err) onError,
  }) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: code);

      // Sign the user in (or link) with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseAuth.instance.userChanges().listen((User? user) async {
        if (user != null) {
          await userCollection.doc(user.uid).set({
            'uid': user.uid,
            'phone': user.phoneNumber,
            'name': name,
            'birthday': birthDay,
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
