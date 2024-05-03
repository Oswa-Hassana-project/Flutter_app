import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/quran_model.dart';
import '../services/quran_service.dart';

class SearchView extends StatelessWidget {
  // final QuranModel  model;
  const SearchView({super.key });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search ayahs'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child:Text(""
          ),
        ),
      ),
    );
  }
}

QuranModel? quranModel;
