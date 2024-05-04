import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:finalproject/model/azkarModel.dart';
import 'package:finalproject/shared/cubit/azkarStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/model/loadAzkar.dart';


class AzkarCubit extends Cubit<AzkarStates>{
  final LoadAzkarData loadData;
  AzkarCubit(this.loadData) : super(AppInitalState());

  static AzkarCubit get(context)=> BlocProvider.of(context);


  Future<void> loadJsonData() async {
    try {
      final AzkarData = await loadData.GetAzkData() ;
      isBookmarked = List.generate(AzkarData.length, (_) => false);
      emit(BookIconToggle());
      emit(LoadAzkarState(AzkarData));

    }catch (e) {
      print(e.toString());
      emit(ErrorAppState( e.toString()));
    }
  }

  List<bool> isBookmarked = [];
  void toggleBookmark(int index) {
    if (state is LoadAzkarState) {
      List<Azkar> updatedAzkarList = List.from((state as LoadAzkarState).GetAzkar); // Make a copy of the current Azkar list
      if (index >= 0 && index < updatedAzkarList.length) { // Ensure index is valid
        isBookmarked[index] = !isBookmarked[index];
        updatedAzkarList[index].isBookmarked = isBookmarked[index]; // Update the bookmark status for the specified index
        emit(LoadAzkarState(updatedAzkarList)); // Emit the updated state with the modified list
      }
    }
  }

  bool isBook=false;
  void ToggleIsbook (){
    isBook =!isBook;
    loadJsonData();
  }
}