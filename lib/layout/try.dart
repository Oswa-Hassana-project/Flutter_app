// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Email
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 controller: _email,
//                 decoration: const InputDecoration(
//                   label: Text('Email'),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Email is required';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             // Password
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextFormField(
//                 controller: _password,
//                 keyboardType: TextInputType.emailAddress,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   label: Text('Password'),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Password is required';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             // Login Button
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     try {
//                       var requestBody = jsonEncode({
//                         // 'email': _email.text,
//                         // 'password': _password.text,
//                         'email': "mohamedabdullah1348744@gmail.com",
//                         'password': "joker#1234",
//                       });
//                       var response = await http.post(
//                         Uri.parse(
//                           'http://uswatest.ddns.net:3000/login',
//                         ),
//                         headers: {
//                           'Content-Type':
//                               'application/json', // Set the content type to JSON
//                         },
//                         body: requestBody,
//                       );
//                       print(response.statusCode);
//
//                       if (response.statusCode == 200 ||
//                           response.statusCode == 400) {
//                         print(response.body);
//                         print('Success');
//                       } else {
//                         print('Failed');
//                       }
//                     } catch (e) {
//                       print(e.toString());
//                     }
//                   }
//                   // print(_email.text);
//                   // print(_password.text);
//                 },
//                 child: const Text('Login'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// _______________________________________________here the part for get surah by number _______________________________________
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// // Define a model class for the data
// class QuranModel {
//   final int number;
//   final String name;
//   final String ayahs;
//
//   QuranModel({required this.number, required this.name, required this.ayahs});
// }
//
// // Fetch data from the API and navigate to the next screen
// void fetchDataAndNavigate(BuildContext context) async {
//   final url = 'https://api.alquran.cloud/v1/quran/quran-uthmani';
//   final response = await http.get(Uri.parse(url));
//
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body) as Map<String, dynamic>;
//     final data = json['data'] as Map<String, dynamic>;
//     final surahs = data['surahs'] as List<dynamic>;
//
//     // Assuming you want to navigate to the next screen after processing the data
//     final results = surahs.map((surah) {
//       final surahData = surah as Map<String, dynamic>;
//       final ayahs = surahData['ayahs'] as List<dynamic>;
//       final ayahText = ayahs.map((ayah) => ayah['text']).join('\n');
//
//       return QuranModel(
//         number: surahData['number'],
//         name: surahData['name'] as String,
//         ayahs: ayahText as String,
//       );
//     }).toList();
//
//     // Navigate to the next screen with the fetched data
//     Navigator.push(context,
//       MaterialPageRoute(
//         builder: (context) => NextScreen(results: results),
//       ),
//     );
//   } else {
//     // Handle error
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to fetch data')),);
//   }
// }
//
// // Define the next screen widget
// class NextScreen extends StatelessWidget {
//   final List<QuranModel> results;
//
//   NextScreen({required this.results});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Surahs from API'),
//       ),
//       body: ListView.builder(
//         itemCount: results.length,
//         itemBuilder: (context, index) {
//           final result = results[index];
//           return ListTile(
//             title: Text(result.name),
//             subtitle: Text(result.ayahs.substring(0, 100)), // Only the first 100 characters
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:project/shared/styles/standers.dart';
//
// import '../shared/styles/response.dart';
//
// class try_quranSurahs extends StatelessWidget {
//   const try_quranSurahs({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//     );
//   }
// }
