import 'package:flutter/material.dart';
import 'package:project/layout/loginpage.dart';
import 'package:project/layout/Quran/quranPage.dart';
import 'package:project/sign_up.dart';
import 'package:project/trysignup.dart';

import 'layout/Quran/quranhome.dart';
import 'layout/profilepage.dart';
import 'layout/quran_tru_get.dart';
import 'layout/try.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: NextScreen(results: [],),
      body: QuranPage1(),

      // Center(
      //   child: ElevatedButton(
      //       onPressed: ()=> fetchDataAndNavigate(context),
      //       child: (Text('fetch data and navigate'))),
      // ),
    );
  }
}
