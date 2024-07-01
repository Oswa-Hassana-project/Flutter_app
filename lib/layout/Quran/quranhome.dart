import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/quran_cubit.dart';
import 'package:project/layout/Quran/quranPage.dart';

import '../../repository/quran_repository.dart';

class QuranPage1 extends StatelessWidget {
  const QuranPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit(QuranRepository()),
      child: Quransurahs(),

    );
  }
}