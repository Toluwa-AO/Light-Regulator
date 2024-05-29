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
    apiKey: 'AIzaSyA4DaZvp8pJagQYwxR3E1Jo1Je9C5vIOA8',
    appId: '1:629185916557:web:224f682d9b6618b98f3cc4',
    messagingSenderId: '629185916557',
    projectId: 'lightregulat',
    authDomain: 'lightregulat.firebaseapp.com',
    databaseURL: 'https://lightregulat-default-rtdb.firebaseio.com',
    storageBucket: 'lightregulat.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6tgDtlHBCc-uzFgAFEartGKNV6oH42us',
    appId: '1:629185916557:android:475e5373aefe15838f3cc4',
    messagingSenderId: '629185916557',
    projectId: 'lightregulat',
    databaseURL: 'https://lightregulat-default-rtdb.firebaseio.com',
    storageBucket: 'lightregulat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD43ehptqoiwKv_ZXBkJcvue6VESOQKNy0',
    appId: '1:629185916557:ios:be658597848300658f3cc4',
    messagingSenderId: '629185916557',
    projectId: 'lightregulat',
    databaseURL: 'https://lightregulat-default-rtdb.firebaseio.com',
    storageBucket: 'lightregulat.appspot.com',
    iosBundleId: 'com.example.lightRegulatorApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD43ehptqoiwKv_ZXBkJcvue6VESOQKNy0',
    appId: '1:629185916557:ios:26f88cb4e8aeabd18f3cc4',
    messagingSenderId: '629185916557',
    projectId: 'lightregulat',
    databaseURL: 'https://lightregulat-default-rtdb.firebaseio.com',
    storageBucket: 'lightregulat.appspot.com',
    iosBundleId: 'com.example.lightRegulatorApp.RunnerTests',
  );
}
