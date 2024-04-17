import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAFFIxm6Q9RrS5MRNcX8BnFrYjyE-I78LE",
            authDomain: "electriq-9f40b.firebaseapp.com",
            projectId: "electriq-9f40b",
            storageBucket: "electriq-9f40b.appspot.com",
            messagingSenderId: "906821912387",
            appId: "1:906821912387:web:a2091752f4bf572a3f91f6"));
  } else {
    await Firebase.initializeApp();
  }
}
