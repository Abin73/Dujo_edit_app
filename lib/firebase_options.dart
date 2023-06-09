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
    apiKey: 'AIzaSyANdsgHSqGl6sxiCt7VHWu6rtJDx5mdwwI',
    appId: '1:983512130711:web:991cea266a41c65a55b5d2',
    messagingSenderId: '983512130711',
    projectId: 'lepton-dujo-official',
    authDomain: 'lepton-dujo-official.firebaseapp.com',
    storageBucket: 'lepton-dujo-official.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_fvcL7z_xX6stXlsH4efBWRK7oF5z0fk',
    appId: '1:983512130711:android:e680d4cf1fbd15ec55b5d2',
    messagingSenderId: '983512130711',
    projectId: 'lepton-dujo-official',
    storageBucket: 'lepton-dujo-official.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCE3Fhv7jGIXle9iGWcQL-M2T_Nupc4rBE',
    appId: '1:983512130711:ios:a28c2eca94e6ff0555b5d2',
    messagingSenderId: '983512130711',
    projectId: 'lepton-dujo-official',
    storageBucket: 'lepton-dujo-official.appspot.com',
    androidClientId: '983512130711-qflpm3avqhmu536gi7qc5vb12hgqifj1.apps.googleusercontent.com',
    iosClientId: '983512130711-28fi0kcvblm8fkv88fgivv0qfmfv1vue.apps.googleusercontent.com',
    iosBundleId: 'com.example.dujoApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCE3Fhv7jGIXle9iGWcQL-M2T_Nupc4rBE',
    appId: '1:983512130711:ios:a28c2eca94e6ff0555b5d2',
    messagingSenderId: '983512130711',
    projectId: 'lepton-dujo-official',
    storageBucket: 'lepton-dujo-official.appspot.com',
    androidClientId: '983512130711-qflpm3avqhmu536gi7qc5vb12hgqifj1.apps.googleusercontent.com',
    iosClientId: '983512130711-28fi0kcvblm8fkv88fgivv0qfmfv1vue.apps.googleusercontent.com',
    iosBundleId: 'com.example.dujoApplication',
  );
}
