import 'package:fertilizer_recommendation_system/pages/recommendation.dart';
import 'package:fertilizer_recommendation_system/pages/showWeather.dart';
import 'package:flutter/material.dart';

import 'package:fertilizer_recommendation_system/pages/add_device.dart';
import 'package:fertilizer_recommendation_system/pages/profile.dart';


class UserNaviagator extends StatefulWidget {
  const UserNaviagator({super.key});

  @override
  _UserNaviagatorState createState() => _UserNaviagatorState();
}

class _UserNaviagatorState extends State<UserNaviagator> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
  // const HomePage(),
  const WeatherScreen(),
  const AddDevice(),
  const Recommendation(),
  // const CropModel(),
  const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, //Blank app bar
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // fixedColor: Colors.blue,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        useLegacyColorScheme: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Device',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.model_training),
            label: 'Models',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}