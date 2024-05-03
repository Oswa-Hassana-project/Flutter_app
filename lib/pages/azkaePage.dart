import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    List AzkarTitle=['اذكار الصباح','اذكار المساء','أذكار بعد  الصلاة ','أذكار النوم ','أذكار الصلاة','أذكار   الآذان','أذكار المسجد'
      ,'أذكار الوضوء','أذكار دخول وخروج المنزل','أذكار دخول وخروج الخلاء'];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthR(14, context),
                vertical: heightR(17, context)),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                      Text(
                        'Azkar',
                        style: TextStyle(fontSize: sizeR(24, context)),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    ],
                  ),
                  AzkarWidget('اذكار الصباح', context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[1], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[2], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[3], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[4], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[5], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[6], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[7], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[8], context),
                  SizedBox(height: heightR(16, context),),
                  AzkarWidget(AzkarTitle[9], context),


                ],
              ),
            ),
          ),
        ));
  }
}
