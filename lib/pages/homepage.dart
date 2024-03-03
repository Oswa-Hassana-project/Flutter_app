import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.only(top: 45, left: 6, right: 29.7),
                  child: Row(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Jumada II 17, 1445 AH',
                              style: TextStyle(fontSize: 20),
                              children: [
                            TextSpan(
                                text: '\nCairo, Egypt',
                                style: TextStyle(fontSize: 15))
                          ])),
                      Spacer(),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(text: '14:05', style: TextStyle(fontSize: 48)
                    ,children: [TextSpan(
                          text: '\nNext prayer: Asr in 37 minutes',style: TextStyle(fontSize: 15)
                        )]
                    )
                ),
                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:50 ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Prayer_times('الفجر','assets/icons/solar_cloud-sun-2-bold.png','5:17 AM'),
                      Prayer_times('الظهر','assets/icons/icon-park_sun.png','11:56 AM'),
                      Prayer_times('العصر','assets/icons/routine.png','2:45 PM'),
                      Prayer_times('المغرب','assets/icons/solar_sun-fog-broken.png','5:03 PM'),
                      Prayer_times('العشاء','assets/icons/charm_moon.png','6:26 PM'),
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
                              features('assets/icons/Chatbot-removebg-preview 1.png','ChatBot'),
                              features('assets/icons/Quran_Logo_PNG_Vector__EPS__Free_Download-removebg-preview 1.png','القرأن الكريم'),
                              features('assets/icons/img-YKRytuAHw3Rowfv_1672400372 1.png','القبلة'),
                              features('assets/icons/images__2_-removebg-preview 1.png','السيره النبويه'),
                              features('assets/icons/6049863 1.png','الأذكار'),
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
  }
}

Widget Prayer_times (Prayer,image,time){
  return Column(
    children: [
      Text(Prayer,style: TextStyle(fontSize: 15,color: Colors.white),),
      SizedBox(height: 8,),
      Image(image: AssetImage(image),height: 24.1,width: 25),
      SizedBox(height: 8,),
      Text(time,style: TextStyle(fontSize: 10,color: Colors.white),)
    ],

  );
}

Widget features (icon,name){
  return InkWell(
    onTap: () {
      print("click");
    },
    child: Column(
      children: [
        Image(image: AssetImage(icon),width: 42,height: 42,),
        SizedBox(height: 5,),
        Text(name,style: TextStyle(fontSize: 11,color: Colors.black),)
      ],
    ),
  );
}