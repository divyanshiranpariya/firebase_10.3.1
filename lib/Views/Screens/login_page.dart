import 'package:firebase_1/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          child: Text("Sign In Google"),
          onPressed: () async {
            Map<String, dynamic> res =
                await AuthHelper.authHelper.signInWithGoogle();
            if (res['user'] != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Google with Login Sucessfully"),
                backgroundColor: Colors.green,
              ));
              Navigator.of(context).pushReplacementNamed(
                '/',
              );
            } else if (res['error'] != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Google with Login failed",
                ),
                backgroundColor: Colors.red,
              ));
            }
          },
        ),
      ),
    );
  }
}
