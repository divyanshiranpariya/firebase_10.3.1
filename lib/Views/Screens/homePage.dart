import 'package:firebase_1/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
              onPressed: () {
                AuthHelper.authHelper.logOut();
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
