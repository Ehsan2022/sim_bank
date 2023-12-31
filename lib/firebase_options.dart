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
    apiKey: 'AIzaSyBpTh4_oQ1W0bY9ozHS9CHYz1jm0trR2Ww',
    appId: '1:770179814695:web:659e449f33b9aefd25c502',
    messagingSenderId: '770179814695',
    projectId: 'simbank-877a1',
    authDomain: 'simbank-877a1.firebaseapp.com',
    storageBucket: 'simbank-877a1.appspot.com',
    measurementId: 'G-7T3ZCME123',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDypkG3YEwBltvipb-hUApXY2g7WfZfRJA',
    appId: '1:770179814695:android:69b3164798a6715a25c502',
    messagingSenderId: '770179814695',
    projectId: 'simbank-877a1',
    storageBucket: 'simbank-877a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHZdg_CbTK3T4RxmGky9FLWvCn0ooPYzg',
    appId: '1:770179814695:ios:21516f0f456560bb25c502',
    messagingSenderId: '770179814695',
    projectId: 'simbank-877a1',
    storageBucket: 'simbank-877a1.appspot.com',
    iosClientId: '770179814695-aeouck0mmugm3feifaah51a0p2qmmllr.apps.googleusercontent.com',
    iosBundleId: 'com.example.simBank',
  );
}
