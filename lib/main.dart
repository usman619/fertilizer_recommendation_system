// import 'dart:js';

import 'package:fertilizer_recommendation_system/pages/home_page.dart';
import 'package:fertilizer_recommendation_system/pages/profile.dart';
import 'package:fertilizer_recommendation_system/pages/showWeather.dart';
import 'package:fertilizer_recommendation_system/pages/signup.dart';
import 'package:fertilizer_recommendation_system/user_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_recommendation_system/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const SignUp(),
          '/userNavigator': (context) => const UserNaviagator(),
          '/profile': (context) => const Profile(),
          '/weatherscreen': (context) => const WeatherScreen(),
          // '/intro_screen': (context) => const OnBoardingPage(),

    },
  ));
}


