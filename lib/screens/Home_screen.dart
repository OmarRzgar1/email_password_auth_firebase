import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final _auth = FirebaseAuth.instance;
  User? signedInUser;

  @override
  void initState() {
    super.initState();
    User? signedInUser = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "You Signedin As ${signedInUser?.email}",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Center(
            child: FilledButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Sign Out")),
          ),
        ],
      ),
    );
  }
}
