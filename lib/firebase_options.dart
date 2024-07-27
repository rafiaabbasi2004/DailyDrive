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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAgAhl6waA02enri4nQvwCpAiWbjlZtrR4',
    appId: '1:846223058023:web:63511525a7fa3ce12b60c2',
    messagingSenderId: '846223058023',
    projectId: 'todoapp-6887a',
    authDomain: 'todoapp-6887a.firebaseapp.com',
    storageBucket: 'todoapp-6887a.appspot.com',
    measurementId: 'G-HT0B22QLHS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4MPUR_bQD8sR5ABLAkaX-rU43lOiB63w',
    appId: '1:846223058023:android:e942edc7fc9532332b60c2',
    messagingSenderId: '846223058023',
    projectId: 'todoapp-6887a',
    storageBucket: 'todoapp-6887a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANQivv_NfudHOJvFvnyQvmnTnM1i_Qlp4',
    appId: '1:846223058023:ios:e5288cb877b118862b60c2',
    messagingSenderId: '846223058023',
    projectId: 'todoapp-6887a',
    storageBucket: 'todoapp-6887a.appspot.com',
    iosBundleId: 'com.example.kairiz3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANQivv_NfudHOJvFvnyQvmnTnM1i_Qlp4',
    appId: '1:846223058023:ios:e5288cb877b118862b60c2',
    messagingSenderId: '846223058023',
    projectId: 'todoapp-6887a',
    storageBucket: 'todoapp-6887a.appspot.com',
    iosBundleId: 'com.example.kairiz3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAgAhl6waA02enri4nQvwCpAiWbjlZtrR4',
    appId: '1:846223058023:web:a78592b0ad501f6b2b60c2',
    messagingSenderId: '846223058023',
    projectId: 'todoapp-6887a',
    authDomain: 'todoapp-6887a.firebaseapp.com',
    storageBucket: 'todoapp-6887a.appspot.com',
    measurementId: 'G-PRZM6KL06C',
  );
}