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
    apiKey: 'AIzaSyB2-TeUb2cBF8RGShHNo5ciztgVTMuwGfk',
    appId: '1:1009330445595:web:8ebf36525d3e200ab5c7be',
    messagingSenderId: '1009330445595',
    projectId: 'bootcampauthenticator',
    authDomain: 'bootcampauthenticator.firebaseapp.com',
    storageBucket: 'bootcampauthenticator.appspot.com',
    measurementId: 'G-S0FFG999GP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArgEjshSJ_n9ZJzVhJdaLpeejK2ZW9a7w',
    appId: '1:1009330445595:android:2eaa43046a86dcb9b5c7be',
    messagingSenderId: '1009330445595',
    projectId: 'bootcampauthenticator',
    storageBucket: 'bootcampauthenticator.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmH0-MbqAvlGj6ZXaRbXYmvNfXBbWp_KQ',
    appId: '1:1009330445595:ios:4f9f3077845bd13fb5c7be',
    messagingSenderId: '1009330445595',
    projectId: 'bootcampauthenticator',
    storageBucket: 'bootcampauthenticator.appspot.com',
    iosClientId: '1009330445595-39qthd6351tq3hcutitmtilrsc2tct2q.apps.googleusercontent.com',
    iosBundleId: 'com.example.bootcampGoua',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmH0-MbqAvlGj6ZXaRbXYmvNfXBbWp_KQ',
    appId: '1:1009330445595:ios:c7cd8db503454697b5c7be',
    messagingSenderId: '1009330445595',
    projectId: 'bootcampauthenticator',
    storageBucket: 'bootcampauthenticator.appspot.com',
    iosClientId: '1009330445595-n3h65jj4vd235g98mr4oat3oin35onk7.apps.googleusercontent.com',
    iosBundleId: 'com.example.bootcampGoua.RunnerTests',
  );
}
