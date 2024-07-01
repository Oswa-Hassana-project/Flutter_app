import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/shared/components/text_form_field.dart';
import 'package:project/shared/styles/standers.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  @override
  void initState() {
    super.initState();
    _checkAutoLogin();
  }

  var _formKey = GlobalKey<FormState>();

  Future<void> _checkAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final account_id = prefs.getString('account_id');
    if (token != null && account_id != null) {
      var requestBody = jsonEncode({
        'token': token,
      });
      var response = await httpClient.post(
        Uri.parse(
          'https://uswahasana.ddns.net/account/login',
        ),
        headers: {
          'Content-Type': 'application/json',
          'USKSCH':
              'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77'
        },
        body: requestBody,
      );
      if (response == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuranPage1()));
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginPage()),
      );
    }
  }

  Future<void> _saveCredentials(
      String subscriptionId, String accountId, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('subscriptionId', subscriptionId);
    await prefs.setString('account_id', accountId);
    await prefs.setString('token', token);
  }

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
                          });
                          var response = await httpClient.post(
                            Uri.parse(
                              'https://uswahasana.ddns.net/account/login',
                            ),
                            headers: {
                              'Content-Type': 'application/json',
                              'USKSCH':
                                  'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77'
                            },
                            body: requestBody,
                          );
                          print(response.statusCode);
                          print(response.body);

                          Map<String, dynamic> data =
                              json.decode(response.body);
                          if (response.statusCode == 200) {
                            await _saveCredentials(
                              data['subscriptionId'],
                              data['account_id'],
                              data['token'],
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => QuranPage1()),
                            );
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
