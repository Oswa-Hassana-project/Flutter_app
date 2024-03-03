import 'package:finalproject/homepage.dart';
import 'package:finalproject/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xff13a795),
      ),debugShowCheckedModeBanner: false,
      home: sign_up(),
    );
  }
}
