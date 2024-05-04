import 'package:finalproject/chatbot/chatBot.dart';
import 'package:finalproject/model/repositories.dart';
import 'package:finalproject/pages/azkaePage.dart';
import 'package:finalproject/pages/edit_profile.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/notificationsPage.dart';
import 'package:finalproject/shared/cubit/cubit.dart';
import 'package:finalproject/shared/cubit/states.dart';
import 'package:finalproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AppCubit(TimeRepository())..fetchTime(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          AppCubit cubit= AppCubit.get(context);
          //state is LoadingAppState ||
          if (state is AppInitalState) {
            return Scaffold(body: Center(child: CircularProgressIndicator()),);
          }else if (state is LoadAzanTimeState ) {
            final AzanT = state.AzanTime;
            return Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/image/homebaGr.png"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 6, right: 6),
                          child: Row(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '${AzanT[0].monthAr} II ${AzanT[0].date}',
                                      style: TextStyle(fontSize: 20),
                                      children: [
                                        TextSpan(
                                            text: '\nCairo, Egypt',
                                            style: TextStyle(fontSize: 15))
                                      ])),
                              Spacer(),
                              IconButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage() ,));
                              }, icon: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              )),
                              IconButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage() ,));
                              }, icon: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 30,
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(text: cubit.Time, style: TextStyle(fontSize: 48)
                                ,children: [TextSpan(
                                    text: '\n',style: TextStyle(fontSize: 15) //Next prayer: Asr in ** minutes
                                )]
                            )
                        ),
                        SizedBox(height: 60,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:50 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Prayer_times('الفجر','assets/icons/solar_cloud-sun-2-bold.png',AzanT[0].Fajr),
                              Prayer_times('الظهر','assets/icons/icon-park_sun.png',AzanT[0].Dhuhr),
                              Prayer_times('العصر','assets/icons/routine.png',AzanT[0].Asr),
                              Prayer_times('المغرب','assets/icons/solar_sun-fog-broken.png',AzanT[0].Maghrib),
                              Prayer_times('العشاء','assets/icons/charm_moon.png',AzanT[0].Isha),
                            ],
                          ),
                        ),
                        SizedBox(height: 41,),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(90),topRight: Radius.circular(90))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 33),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('All Features',style: TextStyle(fontSize: 15,color: Colors.black),),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      features('assets/icons/Chatbot-removebg-preview 1.png','ChatBot',ChatBot(),context),
                                      features('assets/icons/Quran_Logo_PNG_Vector__EPS__Free_Download-removebg-preview 1.png','القرأن الكريم',ChatBot(),context),
                                      features('assets/icons/img-YKRytuAHw3Rowfv_1672400372 1.png','القبلة',ChatBot(),context),
                                      features('assets/icons/images__2_-removebg-preview 1.png','السيره النبويه',ChatBot(),context),
                                      features('assets/icons/6049863 1.png','الأذكار',AzkarPage(),context),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }else if (state is ErrorAppState) {
            return Text("Error: ${state.massage}");
          }
          return Text(" ");

        },
      ),
    );
  }
}





