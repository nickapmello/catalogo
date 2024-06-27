import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAprxJahy5rLdw9wtEErHgVkJJg2QyC0lg",
            authDomain: "app-catalogo-virtual-jiayeb.firebaseapp.com",
            projectId: "app-catalogo-virtual-jiayeb",
            storageBucket: "app-catalogo-virtual-jiayeb.appspot.com",
            messagingSenderId: "859501350719",
            appId: "1:859501350719:web:5030584c878eedb9d64d8a"));
  } else {
    await Firebase.initializeApp();
  }
}
