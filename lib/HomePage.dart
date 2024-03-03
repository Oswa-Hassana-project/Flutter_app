import 'package:flutter/material.dart';
import 'package:project/shared/components/text_form_field.dart';
import 'package:project/shared/styles/standers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    final _password = TextEditingController();
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage("assets/logo/oswah.png"),
            width: 110,
            height: 110,
          ),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 45,
              color: Colors.white,
            ),
          ),
          Text(
            'Sign in your account',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          TextFormWidget(
            Controller: _email,
            keyboardType: TextInputType.emailAddress,
            label: "Username",
            preIcon: Icons.person,
          ),
          TextFormWidget(
            Controller: _password,
            keyboardType: TextInputType.visiblePassword,
            label: "Password",
            preIcon: Icons.key,
            sufIcon: Icons.remove_red_eye,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff004038),
                    fixedSize: Size(double.maxFinite, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17))),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I Forget my password.'),
              InkWell(
                onTap: (){},
                child: Text('Click here to reset'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
