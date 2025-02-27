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
    apiKey: 'AIzaSyBW8qSyAfU4To_keMkJW2Z_vTtcusZgmN4',
    appId: '1:196321619600:web:c1c63635080cdf1ba23215',
    messagingSenderId: '196321619600',
    projectId: 'my-spotify-617fe',
    authDomain: 'my-spotify-617fe.firebaseapp.com',
    storageBucket: 'my-spotify-617fe.firebasestorage.app',
    measurementId: 'G-DBNZWHCMSK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx8arfpJFvNTK10IR-fQVkdYVDmZGekA4',
    appId: '1:196321619600:android:7480dc74ef52f9b1a23215',
    messagingSenderId: '196321619600',
    projectId: 'my-spotify-617fe',
    storageBucket: 'my-spotify-617fe.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNi3nwx8Ul4SD5ZeXG-m6eST6D_0iOuwM',
    appId: '1:196321619600:ios:3fb5e3877482455ea23215',
    messagingSenderId: '196321619600',
    projectId: 'my-spotify-617fe',
    storageBucket: 'my-spotify-617fe.firebasestorage.app',
    iosBundleId: 'com.example.mySpotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNi3nwx8Ul4SD5ZeXG-m6eST6D_0iOuwM',
    appId: '1:196321619600:ios:3fb5e3877482455ea23215',
    messagingSenderId: '196321619600',
    projectId: 'my-spotify-617fe',
    storageBucket: 'my-spotify-617fe.firebasestorage.app',
    iosBundleId: 'com.example.mySpotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBW8qSyAfU4To_keMkJW2Z_vTtcusZgmN4',
    appId: '1:196321619600:web:3340764d24829fb5a23215',
    messagingSenderId: '196321619600',
    projectId: 'my-spotify-617fe',
    authDomain: 'my-spotify-617fe.firebaseapp.com',
    storageBucket: 'my-spotify-617fe.firebasestorage.app',
    measurementId: 'G-VE063JLX6F',
  );
}
