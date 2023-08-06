import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-QUb7D83FXLjyDLUhCWTK8K6cdjWwiOQ",
            authDomain: "suas-392606.firebaseapp.com",
            projectId: "suas-392606",
            storageBucket: "suas-392606.appspot.com",
            messagingSenderId: "1058836917465",
            appId: "1:1058836917465:web:ce2a99fa39010cbe88a2c8",
            measurementId: "G-T89VDV5BC7"));
  } else {
    await Firebase.initializeApp();
  }
}
