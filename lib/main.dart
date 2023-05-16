import 'dart:convert';
// import 'dart:js';

import 'package:fertilizer_recommendation_system/pages/home_page.dart';
import 'package:fertilizer_recommendation_system/services/model_api.dart';
import 'package:fertilizer_recommendation_system/services/weather_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_recommendation_system/pages/login.dart';
import 'package:fertilizer_recommendation_system/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
      MaterialApp(
        initialRoute: '/home',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const SignUp(),
          '/weather': (context) => const WeatherApp(),
    },
  ));
}



// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var data;
//   late String url;
//   String QueryText = "Result: ";
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//       ),
//       home: const Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Testing Python Connection'),
//         //
//         // ),
//         body: Login(),
//       ),
//     );
//   }
// }

// Widget connectApi(){
//   return Column(
//     children: <Widget>[
//       Text(
//         QueryText,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       TextButton(
//         onPressed: () async {
//
//           var url = Uri.http("192.168.10.82:5000", "/api", {"Query": "my name is usman"});
//           data = await Getdata(url);
//           var dataJson = jsonDecode(data);
//           setState(() {
//             QueryText = dataJson['Query'];
//           });
//         },
//         child: const Text('Get data'),
//       )
//     ],
//   );
// }
