import 'package:flutter/material.dart';

class QuranPage1 extends StatelessWidget {
  const QuranPage1({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            )),
        title: Center(
            child: Text(
          "Qur'an",
          style: TextStyle(
            color: Colors.black,
          ),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.only(
          top: 0.111 * h,
          left: 0.14 * w,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF13a795),
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: w * 0.72,
              height: h * 0.18,
            ),
            SizedBox(
              height: h * 0.075,
            ),
            // BottomNavigationBar(items: const <BottomNavigationBarItem>[
            //
            //
            // ])
          ],
        ),
      ),
    );
  }
}
