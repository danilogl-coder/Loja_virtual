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
    apiKey: 'AIzaSyCpFkxtQzFOQyU-RIECiabXapPHhuslVYs',
    appId: '1:670868099402:web:1124e87d0d4197c656b1b3',
    messagingSenderId: '670868099402',
    projectId: 'loja-virtual-ljl',
    authDomain: 'loja-virtual-ljl.firebaseapp.com',
    storageBucket: 'loja-virtual-ljl.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkYDXHgfghnfE-lhcWgP7ciE_G4n60Wbs',
    appId: '1:670868099402:android:0a7d4f5524cc411356b1b3',
    messagingSenderId: '670868099402',
    projectId: 'loja-virtual-ljl',
    storageBucket: 'loja-virtual-ljl.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDp-WqYJeyo34rmT8xC1jFcdNDjVdxHx5Q',
    appId: '1:670868099402:ios:503b78d98dcd57f756b1b3',
    messagingSenderId: '670868099402',
    projectId: 'loja-virtual-ljl',
    storageBucket: 'loja-virtual-ljl.appspot.com',
    iosClientId: '670868099402-lgedrc5erik8hklmkiuqcbi4elk8nar1.apps.googleusercontent.com',
    iosBundleId: 'br.com.guilherme.lojaVirtual',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDp-WqYJeyo34rmT8xC1jFcdNDjVdxHx5Q',
    appId: '1:670868099402:ios:bf2e5691bc9e0b1056b1b3',
    messagingSenderId: '670868099402',
    projectId: 'loja-virtual-ljl',
    storageBucket: 'loja-virtual-ljl.appspot.com',
    iosClientId: '670868099402-92539dtnqufsk9dupltmbco9cgpuqfe7.apps.googleusercontent.com',
    iosBundleId: 'br.com.guilherme.lojaVirtual.RunnerTests',
  );
}
