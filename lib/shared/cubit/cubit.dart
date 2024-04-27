import 'package:bloc/bloc.dart';
import 'package:finalproject/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitalState());

  static AppCubit get(context)=> BlocProvider.of(context);

  bool isPassword =true;


  void PasswordIsShow (){
    isPassword =!isPassword;
    emit(PasswordShow());
  }






}