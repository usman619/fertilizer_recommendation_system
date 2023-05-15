import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  static const String apiUrl = 'https://weatherbit-v1-mashape.p.rapidapi.com';
  static const String apiKey = 'a4e38e1af6mshca2cc272863c3afp151f2ejsn7b349ddd7cfe';
  static const String apiHost = 'weatherbit-v1-mashape.p.rapidapi.com';

  static Future<Map<String, dynamic>> getWeatherData(double latitude, double longitude) async {
    final url = Uri.parse('$apiUrl/forecast/3hourly?lat=$latitude&lon=$longitude');

    final response = await http.get(
      url,
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': apiHost,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String _locationMessage = '';
  Map<String, dynamic> _weatherData = {};

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _locationMessage = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });
      final weatherData = await WeatherApi.getWeatherData(position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
        print(_weatherData);
      });
    } catch (e) {
      print(e);
    }
  }
  // Returns the temperature, humidity and short weather description
  Widget _buildWeatherData() {
    if (_weatherData.isNotEmpty) {
      var data = _weatherData['data'][0];
      var temperature = data['temp'];
      var humidity = data['rh'];
      var weatherDescription = data['weather']['description'];

      return Column(
        children: [
          Text(
            'Temperature: $temperature',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Humidity: $humidity',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Weather Description: $weatherDescription',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   _locationMessage,
            //   style: const TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            _buildWeatherData(),
            const SizedBox(height: 20),
            // _weatherData.isNotEmpty
            //     ? Text(
            //   'Weather data: $_weatherData',
            //   style: const TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // )
            //     : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}



