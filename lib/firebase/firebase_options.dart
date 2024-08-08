// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLyKSaZPHrr3JpKMRO6q7DC3RAXXs8g9I',
    appId: '1:205668398896:android:3fb42b991d80eb2e44faf5',
    messagingSenderId: '205668398896',
    projectId: 'cfpay-98650',
    storageBucket: 'cfpay-98650.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-dilq9B3KvEPSBPISdMP6tD2t_hHgVA4',
    appId: '1:205668398896:ios:25cc8fe005614aa744faf5',
    messagingSenderId: '205668398896',
    projectId: 'cfpay-98650',
    storageBucket: 'cfpay-98650.appspot.com',
    iosBundleId: 'com.example.cfpay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-dilq9B3KvEPSBPISdMP6tD2t_hHgVA4',
    appId: '1:205668398896:ios:25cc8fe005614aa744faf5',
    messagingSenderId: '205668398896',
    projectId: 'cfpay-98650',
    storageBucket: 'cfpay-98650.appspot.com',
    iosBundleId: 'com.example.cfpay',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARWswZeaR2xawS66H_Tv2riS2ylmGQdsU',
    appId: '1:205668398896:web:2bd2511ad5ac910344faf5',
    messagingSenderId: '205668398896',
    projectId: 'cfpay-98650',
    authDomain: 'cfpay-98650.firebaseapp.com',
    storageBucket: 'cfpay-98650.appspot.com',
    measurementId: 'G-32KLCKFMP3',
  );
}
