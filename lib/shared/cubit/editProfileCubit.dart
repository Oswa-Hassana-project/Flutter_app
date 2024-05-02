import 'package:bloc/bloc.dart';
import 'package:finalproject/shared/cubit/profileStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(AppInitalState());

  static ProfileCubit get(context)=> BlocProvider.of(context);

  String? CCountry=null;
  String? selectedGender=null;
  var GenderController = TextEditingController();
  var CountryController = TextEditingController();
  var PhoneNumberController = TextEditingController();

  phoneNumber(String Phone){
    PhoneNumberController.text=Phone;
    emit(GetPhoneState());
  }
  ChangeCountry(String Country){
    CCountry =Country;
    CountryController.text =Country;
    emit(GetCountryState());
  }
  ChangeGender(String Gender){
    selectedGender =Gender;
    GenderController.text=Gender;
    emit(GetGenderState());
  }

}