import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/quran_cubit.dart';
import 'package:project/cubit/quran_state.dart';
import '../../shared/styles/response.dart';

class Quransurahs extends StatefulWidget {
  const Quransurahs({super.key});

  @override
  State<Quransurahs> createState() => _QuransurahsState();
}

class _QuransurahsState extends State<Quransurahs> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<QuranCubit>();
      cubit.fetchQuran();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            )),
        title: Center(
            child: Text(
          "Qur'an",
          style: TextStyle(
            color: Colors.black,
          ),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
        ],
      ),
      body: BlocBuilder<QuranCubit, quranState>(
        builder: (context, state) {
          if (state is InitQuranState || state is LoadingQuranState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (state is ResponseQuranState){
            final qurans = state.qurans;
            return ListView.builder(
              itemCount: qurans.length,
                itemBuilder: (context,index){
                  final quran = qurans[index];
                  return ListTile(
                      title: Text(quran.name) ,
                  );
                }
            );
          }
          return Center(
            child: Text(
              state.toString(),
            ),
          );
        },
      ),
    );
  }
}
