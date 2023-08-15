import 'package:email_password_auth_firebase/screens/signin_screen.dart';
import 'package:email_password_auth_firebase/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutterFire",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FlutterFireAuth"),
          centerTitle: true,
        ),
        body: Auth(),
      ),
    );
  }
}
