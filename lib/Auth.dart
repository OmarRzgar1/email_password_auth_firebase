import 'package:email_password_auth_firebase/screens/Home_screen.dart';
import 'package:email_password_auth_firebase/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return homeScreen();
          } else {
            return Signin();
          }
        }),
      ),
    );
  }
}
