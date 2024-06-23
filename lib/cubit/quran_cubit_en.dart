import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/quran_state_en.dart';
import 'package:project/repository/quran_repository_english.dart';

class QuranCubitEN extends Cubit<quranStateEN>{
  final quranRepositoryEn _repository;
  QuranCubitEN(this._repository) : super(InitQuranState());

  Future<void> fetchQuran() async {
    emit(LoadingQuranState());
    try{
      final response = await _repository.getAll();
      emit(ResponseQuranState(response));
    }catch(e){
      // throw Exception("error in here ");
      emit(ErrorQuranState(e.toString()));
      print(e.toString());
    }

  }


}