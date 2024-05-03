import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/material.dart';

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

Widget AzkarWidget(String title,context){
  return  Container(
    width: widthR(362, context),
    height: heightR(54, context),
    decoration: BoxDecoration(
      color: Color(0xFFc7e7e3),
      borderRadius:
      BorderRadius.circular(sizeR(23, context)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark),
          iconSize: sizeR(35, context),
        ),
        Spacer(flex: 5),

        Text(
          title,
          style: TextStyle(fontSize: sizeR(18, context),),
        ),
        Spacer(flex: 1,),
        Image(
          image: AssetImage(
            'assets/icons/Rectangle 998.png',
          ),
        ),
      ],
    ),
  );
}

