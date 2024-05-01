import 'dart:async';
import 'dart:convert';
import 'package:finalproject/model/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:finalproject/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubit extends Cubit<AppStates>{
  final TimeRepository _repository;
  late Timer  _timer;
  AppCubit(this._repository):super(AppInitalState()){
    _timer = Timer.periodic(Duration(seconds: 1), (_) => fetchTime());
  }

  static AppCubit get(context)=> BlocProvider.of(context);
  DateTime now =DateTime.now();
  bool isPassword =true;
  String Time="";
  void PasswordIsShow (){
    isPassword =!isPassword;
    emit(PasswordShow());
  }
  Future<void> fetchTime() async {
    //emit(LoadingAppState());
    try {
      final time = await _repository.getTime();
      final currentTime = DateTime.now();
      Time = '${currentTime.hour}:${currentTime.minute}';
      emit(LoadAzanTimeState(time));


    } catch (e) {
      print(e.toString());
      emit(ErrorAppState( e.toString()));
    }
  }

  // void GetTimeNow(){
  //   final currentTime = DateTime.now();
  //   if (_lastEmittedTime.minute != currentTime.minute) {
  //     _lastEmittedTime = currentTime;
  //
  //     emit(AppTimeNow());
  //     fetchTime();
  //   }
  // }

  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

  // Future<void> AzanTime()async{
  //   var responce =await http.get(Uri.parse("http://api.aladhan.com/v1/timingsByCity?city=Egyptian General Authority of Survey&country=Egypt&method=5"));
  //   var responceBody = jsonDecode(responce.body);
  //   print(responceBody["data"]["timings"]["Fajr"]);
  //   emit(GetAzanTiming());
  // }






}