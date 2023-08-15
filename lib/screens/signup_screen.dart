import 'package:email_password_auth_firebase/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'Home_screen.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String ConfirmPassword;
  late bool PasswordShowen;
  @override
  void initState() {
    super.initState();
    PasswordShowen = true;
  }

  bool PasswordConfrimed() {
    if (password == ConfirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text("Sign up",
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      fillColor: Colors.blueGrey[300],
                      iconColor: Color.fromRGBO(133, 146, 123, 1),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 19),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(133, 146, 123, 1),
                              width: 2.4),
                          borderRadius: BorderRadius.circular(16)),
                      suffixIcon: Image.asset("assets/icons/address.png")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  obscureText: PasswordShowen,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey[300],
                    iconColor: Color.fromRGBO(133, 146, 123, 1),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 19),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(133, 146, 123, 1),
                            width: 2.4),
                        borderRadius: BorderRadius.circular(16)),
                    suffixIcon: FilledButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {
                        setState(() {
                          PasswordShowen = !PasswordShowen;
                        });
                      },
                      child: Image.asset(
                        "assets/icons/hide.png",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) {
                    ConfirmPassword = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey[300],
                    iconColor: Color.fromRGBO(133, 146, 123, 1),
                    hintText: "Confrim Password",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 19),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(133, 146, 123, 1),
                            width: 2.4),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () async {
                        if (PasswordConfrimed()) {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            _auth.userChanges();
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("cannot create new user");
                        }
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homeScreen(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 35),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(380, 70),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Signin()),
                            (route) => false);
                      },
                      child: Text("Log in",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
