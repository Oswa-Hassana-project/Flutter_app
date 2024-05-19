import 'dart:async';
import 'dart:convert';
import 'package:finalproject/model/dataModel.dart';
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
  Duration timeUntilNextPrayer = Duration.zero;
  String nextPrayer = "";

  void PasswordIsShow (){
    isPassword =!isPassword;
    emit(PasswordShow());
    fetchTime();
  }
  Future<void> fetchTime() async {
    //emit(LoadingAppState());
    try {
      final time = await _repository.getTime();
      final currentTime = DateTime.now();
      Time = '${currentTime.hour}:${currentTime.minute}';
      calculateNextPrayer(currentTime, time[0]);
      emit(LoadAzanTimeState(time));
    } catch (e) {
      print(e.toString());
      emit(ErrorAppState( e.toString()));
    }
  }

  void calculateNextPrayer(DateTime now, TimeAzanModel azanTime) {
    List<Map<String, String>> prayers = [
      {"name": "الفجر", "time": azanTime.Fajr},
      {"name": "الظهر", "time": azanTime.Dhuhr},
      {"name": "العصر", "time": azanTime.Asr},
      {"name": "المغرب", "time": azanTime.Maghrib},
      {"name": "العشاء", "time": azanTime.Isha},
    ];

    DateTime nearestPrayerTime = DateTime(now.year, now.month, now.day, 23, 59);
    String nextPrayerName = "";

    for (var prayer in prayers) {
      DateTime prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(prayer["time"]!.split(":")[0]),
        int.parse(prayer["time"]!.split(":")[1]),
      );

      // Check if the prayer time is after the current time and closer than previously found
      if (prayerTime.isAfter(now) && prayerTime.isBefore(nearestPrayerTime)) {
        nearestPrayerTime = prayerTime;
        nextPrayerName = prayer["name"]!;
      }
    }

    // If nearest prayer time is before current time, it's for tomorrow
    if (nearestPrayerTime.isBefore(now)) {
      nearestPrayerTime = nearestPrayerTime.add(Duration(days: 1));
    }

    // Calculate time until the next prayer
    timeUntilNextPrayer = nearestPrayerTime.difference(now);
    nextPrayer = nextPrayerName;
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