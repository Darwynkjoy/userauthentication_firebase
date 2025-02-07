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
    apiKey: 'AIzaSyC__-JdUp9ipTdDSq0LFvT0Kyq1xEj8NAI',
    appId: '1:514930643531:web:0f0ba5a1235d0d9b7e33ce',
    messagingSenderId: '514930643531',
    projectId: 'user-authentication-5710d',
    authDomain: 'user-authentication-5710d.firebaseapp.com',
    storageBucket: 'user-authentication-5710d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIwSlEnySXAT2HhmsjzUxUu18lHQ4yIY0',
    appId: '1:514930643531:android:64c97b635a285fce7e33ce',
    messagingSenderId: '514930643531',
    projectId: 'user-authentication-5710d',
    storageBucket: 'user-authentication-5710d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7oDN532M1lJW_zJyQ6JOTTEfYmZJKikc',
    appId: '1:514930643531:ios:54b9a90f93d88e0b7e33ce',
    messagingSenderId: '514930643531',
    projectId: 'user-authentication-5710d',
    storageBucket: 'user-authentication-5710d.firebasestorage.app',
    iosBundleId: 'com.example.userAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7oDN532M1lJW_zJyQ6JOTTEfYmZJKikc',
    appId: '1:514930643531:ios:54b9a90f93d88e0b7e33ce',
    messagingSenderId: '514930643531',
    projectId: 'user-authentication-5710d',
    storageBucket: 'user-authentication-5710d.firebasestorage.app',
    iosBundleId: 'com.example.userAuthentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC__-JdUp9ipTdDSq0LFvT0Kyq1xEj8NAI',
    appId: '1:514930643531:web:b2c1e88f270c5e487e33ce',
    messagingSenderId: '514930643531',
    projectId: 'user-authentication-5710d',
    authDomain: 'user-authentication-5710d.firebaseapp.com',
    storageBucket: 'user-authentication-5710d.firebasestorage.app',
  );
}
