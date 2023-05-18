import 'dart:convert';
// import 'dart:js';

import 'package:fertilizer_recommendation_system/pages/home_page.dart';
import 'package:fertilizer_recommendation_system/pages/profile.dart';
import 'package:fertilizer_recommendation_system/user_navigator.dart';
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
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const SignUp(),
          '/userNavigator': (context) => const UserNaviagator(),
          '/profile': (context) => const Profile(),

    },
  ));
}


