import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fertilizer_recommendation_system/services/weather_api.dart';
import 'package:geolocator/geolocator.dart';

import '../widgets/circular_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // For Sign Out
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Getting Weather Info
  String _locationMessage = '';
  Map<String, dynamic> _weatherData = {};

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _signOut() async {
    _auth.signOut();

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);

  }
  // Get User Location
  Future<void> _getLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _locationMessage =
        'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
      final weatherData =
      await WeatherApi.getWeatherData(position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
        print(_weatherData);
      });
    } catch (e) {
      print(e);
    }
  }

  // Return Weather Info
  Widget _buildWeatherData() {
    if (_weatherData.isNotEmpty) {
      var data = _weatherData['data'][0];
      var temperature = data['temp'];
      var humidity = data['rh'];
      var weatherDescription = data['weather']['description'];

      return Column(
        children: [
          const Text(
            'Weather Data',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),

          circularIndicator('Temperature', '°C', temperature),

          circularIndicator('Humidity', '%', humidity),

          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),  // Shadow color
                  spreadRadius: 2,                      // Spread radius
                  blurRadius: 5,                        // Blur radius
                  offset: const Offset(0, 3),                  // Offset in the x,y direction
                ),
              ],

            ),

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 3.0),

                  const Text(
                    'Weather Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    weatherDescription,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                      ),
                    ),
                ],
              ),
            ),
          )

        ],
      );
    } else {

      return const CircularProgressIndicator();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'sign_out') {
                _signOut();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'sign_out',
                child: Text('Sign Out'),
              ),
            ],
            child: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          _buildWeatherData(),
          const Center(
            child: Text(
              'IoT Device Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ]
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //
      //   fixedColor: Colors.blue,
      // ),
    );
  }
}
