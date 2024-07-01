import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Column(children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios),),
              Text('Notifications',style: TextStyle(fontSize: sizeR(22, context),fontWeight: FontWeight.w700),),
              SizedBox(width: 40,),
            ],
          ),
        ),
        SizedBox(height: 50,),
      Text("Notofication is empty")
      ],),
    ),);
  }

}
