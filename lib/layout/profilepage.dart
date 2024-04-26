import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF16a795), Color(0xFFc2aa9f)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {},
              child: Center(
                  child: Text(
                'Settings',
                style: TextStyle(fontSize: 20),
              )),
            ),
          ),
          leadingWidth: 83,
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
            )),
          ],
        ),
      ),
      body: CircleAvatar(
        radius: 50,
      ),
    );
  }
}
