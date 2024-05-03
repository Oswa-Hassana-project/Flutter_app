import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
            ),
            // Password
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _password,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
            ),
            // Login Button
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      var requestBody = jsonEncode({
                        'email': "mohamedabdullah1348744@gmail.com",
                        'password': "joker#1234",
                        'firstname': "Mohamed",
                        'middlename': "Abdullah",
                        'lastname ': "Mohamed",
                      });
                      var response = await http.post(
                        Uri.parse(
                          'http://uswatest.ddns.net:3000/signup',
                        ),
                        headers: {
                          'Content-Type':
                              'application/json', // Set the content type to JSON
                        },
                        body: requestBody,
                      );
                      print(response.statusCode);

                      if (response.statusCode == 200 ||
                          response.statusCode == 400) {
                        print('Success');
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
                child: const Text('signup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
