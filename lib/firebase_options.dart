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
    apiKey: 'AIzaSyAg7HiOqLBpQwSOK5yJ6hv7pyroatFanpc',
    appId: '1:453515155557:web:f12f57115101c2cecfce8c',
    messagingSenderId: '453515155557',
    projectId: 'ekopii-order-management',
    authDomain: 'ekopii-order-management.firebaseapp.com',
    storageBucket: 'ekopii-order-management.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLi4OJKOp5udHZceAOL-btstRBEzIrqk0',
    appId: '1:453515155557:android:cdd19c97ad8712cecfce8c',
    messagingSenderId: '453515155557',
    projectId: 'ekopii-order-management',
    storageBucket: 'ekopii-order-management.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPlbXgoo9wYbcqJ-NhMGOSKQnqXj6Hg2Q',
    appId: '1:453515155557:ios:9fd9da6ec88efc38cfce8c',
    messagingSenderId: '453515155557',
    projectId: 'ekopii-order-management',
    storageBucket: 'ekopii-order-management.appspot.com',
    iosClientId: '453515155557-n9783d9gnsb3u77j7m2cfkgg10g7jdj9.apps.googleusercontent.com',
    iosBundleId: 'com.example.orderManagementSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPlbXgoo9wYbcqJ-NhMGOSKQnqXj6Hg2Q',
    appId: '1:453515155557:ios:9fd9da6ec88efc38cfce8c',
    messagingSenderId: '453515155557',
    projectId: 'ekopii-order-management',
    storageBucket: 'ekopii-order-management.appspot.com',
    iosClientId: '453515155557-n9783d9gnsb3u77j7m2cfkgg10g7jdj9.apps.googleusercontent.com',
    iosBundleId: 'com.example.orderManagementSystem',
  );
}
