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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC8V046THrmgVo_nSGnpc8rz_RtoGvel7g',
    appId: '1:603942201869:web:f7448febc5bf00a645c344',
    messagingSenderId: '603942201869',
    projectId: 'reddit-d304d',
    authDomain: 'reddit-d304d.firebaseapp.com',
    storageBucket: 'reddit-d304d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHyPA9O1O9Ot7wyqtQVXtZfZefDcES-yo',
    appId: '1:603942201869:android:44746f752a145b0b45c344',
    messagingSenderId: '603942201869',
    projectId: 'reddit-d304d',
    storageBucket: 'reddit-d304d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOvPZ55AzRtwwxiObFzcsjLqmmvxSGkAg',
    appId: '1:603942201869:ios:c7e721cf3095b37645c344',
    messagingSenderId: '603942201869',
    projectId: 'reddit-d304d',
    storageBucket: 'reddit-d304d.appspot.com',
    androidClientId: '603942201869-o85ljolnlgk03mgq0dsrdpm7nl2kcekk.apps.googleusercontent.com',
    iosClientId: '603942201869-nb6f05l5p2f2rha4pjobcau895q5lhoc.apps.googleusercontent.com',
    iosBundleId: 'com.example.deliveryApp',
  );
}
