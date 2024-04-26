import 'package:flutter/material.dart';
import 'package:project/HomePage.dart';
import 'package:project/layout/profilepage.dart';
import 'package:project/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:  HomePage());
  }
}
