import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/shared/components/text_form_field.dart';
import 'package:project/shared/styles/standers.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import '../sign_up.dart';
import 'Quran/quranhome.dart';
import 'forgetpassword.dart';

HttpClient createHttpClient() {
  final HttpClient client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final IOClient httpClient = IOClient(createHttpClient());

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var _formKey = GlobalKey<FormState>();
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
        key: _formKey,
        child: SingleChildScrollView(
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          var requestBody = jsonEncode({
                            'email': _email.text,
                            'password': _password.text,
                            // "account_id": "6675e71ffcfc4d5aea59507d",
                            // "token":
                            //     "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIiwiaXNzIjoiaHR0cHM6Ly9kZXYtbGN2eDF3ZTJrYnVyYWx4ei51cy5hdXRoMC5jb20vIn0..sHeMxqZzr99R21U0.UFxYVnMlN0Gp-OVxMJraUs2NrkMgu3gRCK5P0Gj464_N0-7yDDCcmExa_8Qefsx3Osw1Yocym_bGPV86rJyNxCZa6Cm-KGpz2xO6G76PU9TN-hkllZRtep3ced2hgfURWjBp3LVQRAfm9ZRZOzqcqHNaw2dtdnjAYK9BQ99vC366C2BWnRvXLYftdIirgPGLQEM2WGyfLNW7XEYjRjgvqe2cBi3bwHAGuiPAv592_0WeSD6gNSb7kPk0kIC52BFSEucZRV3g6S3lnMQpl3FVz5HTqEVC22RVYnKi9mr-3XoPNdmjSaEGQ9Q_vAdzm8dZKAD4fhJ4pMkwcP4VsgR7WijVjx_YcWz8RqRU8Ifaq15sZ7Q.LW1j9seGdeiLaplYJHWYRA"
                          });
                          var response = await httpClient.post(
                            Uri.parse(
                              'https://uswahasana.ddns.net/account/login',
                            ),
                            headers: {
                              'Content-Type': 'application/json',
                              'USKSCH':
                                  'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77' // Set the content type to JSON
                            },
                            body: requestBody,
                          );
                          print(response.statusCode);
                          print(response.body);

                          Map<String, dynamic> data =
                              json.decode(response.body);
                          print(data['token']);
                          if (response.statusCode == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => QuranPage1()));
                            print('Success');
                          } else if (response.statusCode == 400) {
                            print("bad Request");
                          } else {
                            print('Failed');
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      // print(_email.text);
                      // print(_password.text);
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forget_password(),
                        ),
                      );
                    },
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
      ),
    );
  }
}
