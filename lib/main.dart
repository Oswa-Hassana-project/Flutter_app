import 'package:flutter/material.dart';
import 'package:project/HomePage.dart';
import 'package:project/layout/profilepage.dart';
import 'package:project/sign_up.dart';
import 'package:bloc/bloc.dart';

import 'cubit/BlocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
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
