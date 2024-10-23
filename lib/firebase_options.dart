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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    appId: '1:420068059687:web:e3f9c72f91180c9e9a7c02',
    messagingSenderId: '420068059687',
    projectId: 'flutter-master-3886a',
    authDomain: 'flutter-master-3886a.firebaseapp.com',
    storageBucket: 'flutter-master-3886a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    appId: '1:420068059687:android:c240a5cdb58e2dcf9a7c02',
    messagingSenderId: '420068059687',
    projectId: 'flutter-master-3886a',
    storageBucket: 'flutter-master-3886a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    appId: '1:420068059687:ios:f2311edc567355b09a7c02',
    messagingSenderId: '420068059687',
    projectId: 'flutter-master-3886a',
    storageBucket: 'flutter-master-3886a.appspot.com',
    iosBundleId: 'com.example.flutterRpg',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    appId: '1:420068059687:web:dc17fae53366cde39a7c02',
    messagingSenderId: '420068059687',
    projectId: 'flutter-master-3886a',
    authDomain: 'flutter-master-3886a.firebaseapp.com',
    storageBucket: 'flutter-master-3886a.appspot.com',
  );
}
