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
    apiKey: 'AIzaSyBk8QDvAcoTeuFxWR_8TcMwjItumEfi5cg',
    appId: '1:468780677284:web:095cbac0c13a2dde6e0e31',
    messagingSenderId: '468780677284',
    projectId: 'afflicartz-26169',
    authDomain: 'afflicartz-26169.firebaseapp.com',
    databaseURL: 'https://afflicartz-26169-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'afflicartz-26169.appspot.com',
    measurementId: 'G-LZWYCRW08L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl-11ymoIOD-_z0J9WpWn7A4Ydp2iAjxE',
    appId: '1:468780677284:android:11f502d41e299fa36e0e31',
    messagingSenderId: '468780677284',
    projectId: 'afflicartz-26169',
    databaseURL: 'https://afflicartz-26169-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'afflicartz-26169.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMEtl2IRWAtL1auQThjP4IvxWdsuUP_nI',
    appId: '1:468780677284:ios:eaf78d30d8f138a06e0e31',
    messagingSenderId: '468780677284',
    projectId: 'afflicartz-26169',
    databaseURL: 'https://afflicartz-26169-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'afflicartz-26169.appspot.com',
    androidClientId: '468780677284-f7ghslha3n3a849n03829o4ep7b36v7k.apps.googleusercontent.com',
    iosClientId: '468780677284-7ic7p3koe8fc37bd9cek46mutaek0f37.apps.googleusercontent.com',
    iosBundleId: 'com.example.test1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMEtl2IRWAtL1auQThjP4IvxWdsuUP_nI',
    appId: '1:468780677284:ios:eaf78d30d8f138a06e0e31',
    messagingSenderId: '468780677284',
    projectId: 'afflicartz-26169',
    databaseURL: 'https://afflicartz-26169-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'afflicartz-26169.appspot.com',
    androidClientId: '468780677284-f7ghslha3n3a849n03829o4ep7b36v7k.apps.googleusercontent.com',
    iosClientId: '468780677284-7ic7p3koe8fc37bd9cek46mutaek0f37.apps.googleusercontent.com',
    iosBundleId: 'com.example.test1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBk8QDvAcoTeuFxWR_8TcMwjItumEfi5cg',
    appId: '1:468780677284:web:095cbac0c13a2dde6e0e31',
    messagingSenderId: '468780677284',
    projectId: 'afflicartz-26169',
    authDomain: 'afflicartz-26169.firebaseapp.com',
    databaseURL: 'https://afflicartz-26169-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'afflicartz-26169.appspot.com',
    measurementId: 'G-LZWYCRW08L',
  );

}