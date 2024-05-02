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

