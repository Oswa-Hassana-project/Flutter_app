import 'package:flutter/material.dart';
import 'package:project/shared/components/text_form_field.dart';
import 'package:project/shared/styles/standers.dart';

import '../sign_up.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: Column(
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
            // text from field for email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: TextFormWidget(
                Controller: _email,
                keyboardType: TextInputType.emailAddress,
                label: "Username",
                preIcon: Icons.person,
              ),
            ),
            // text from field for password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: TextFormWidget(
                Controller: _password,
                keyboardType: TextInputType.visiblePassword,
                label: "Password",
                preIcon: Icons.key,
                sufIcon: Icons.remove_red_eye,
              ),
            ),
            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print(_email.text);
                      print(_password.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff004038),
                      fixedSize: Size(double.maxFinite, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17))),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            // forgat password
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I Forget my password.'),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Click here to reset',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Register New Account
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => sign_up(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(double.maxFinite, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17))),
                  child: Text(
                    "Register New Account",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            // guest
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'continue as a guest >>',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
