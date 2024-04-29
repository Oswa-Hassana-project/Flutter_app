import 'package:bloc/bloc.dart';
import 'package:finalproject/pages/edit_profile.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/sign_up.dart';
import 'package:finalproject/shared/BlocObserver.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
      home: homepage(),
    );
  }
}
