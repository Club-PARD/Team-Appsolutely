// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC68ldSPGTyFw98WghIj34byNwSRUY0GQ8',
    appId: '1:750142358803:web:cb33f9f6f4d61e196f46e6',
    messagingSenderId: '750142358803',
    projectId: 'team-appsolutely',
    authDomain: 'team-appsolutely.firebaseapp.com',
    storageBucket: 'team-appsolutely.appspot.com',
    measurementId: 'G-YS5J8SR69Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3bTbUYwsFLcE8SuwqzgZxThfyVgpp9FA',
    appId: '1:750142358803:android:1b3a0908a225c0bd6f46e6',
    messagingSenderId: '750142358803',
    projectId: 'team-appsolutely',
    storageBucket: 'team-appsolutely.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgYwefsgEl9T4HCQAMcAId81awqnwHz64',
    appId: '1:750142358803:ios:a16f25c5b9c48b406f46e6',
    messagingSenderId: '750142358803',
    projectId: 'team-appsolutely',
    storageBucket: 'team-appsolutely.appspot.com',
    iosClientId: '750142358803-fmdg3q6dece13p625h7v0uasgsimbj42.apps.googleusercontent.com',
    iosBundleId: 'com.example.appsolutely',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgYwefsgEl9T4HCQAMcAId81awqnwHz64',
    appId: '1:750142358803:ios:a16f25c5b9c48b406f46e6',
    messagingSenderId: '750142358803',
    projectId: 'team-appsolutely',
    storageBucket: 'team-appsolutely.appspot.com',
    iosClientId: '750142358803-fmdg3q6dece13p625h7v0uasgsimbj42.apps.googleusercontent.com',
    iosBundleId: 'com.example.appsolutely',
  );
}
