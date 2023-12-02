import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/weatherBit_api.dart';
import '../widgets/weather_widgets.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherBitApi _weatherBitApi = WeatherBitApi();
  Map<String, dynamic>? _weatherData; // Make it nullable

  @override
  void initState() {
    super.initState();
    _loadWeatherData();

  }

  Future<void> _loadWeatherData() async {
    try {
      Map<String, dynamic> data = await _weatherBitApi.getCurrentWeather();
      setState(() {
        _weatherData = data;
        print(_weatherData);
      });
    } catch (e) {
      // Handle errors appropriately
      print('Error loading weather data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: _weatherData == null
            ? const Center(
                child: CircularProgressIndicator()
              )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                '${_weatherData!['data'][0]['city_name']}',
                style: const TextStyle(
                  fontSize: 34,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                _getCurrentDate(),
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
            tempeatureAreaWidget('${_weatherData!['data'][0]['weather']['icon']}','${_weatherData!['data'][0]['weather']['description']}','${_weatherData!['data'][0]['temp']}'),

            Row(
              children: [
                const SizedBox(width: 20),
                circularIndicatorWidget('${_weatherData!['data'][0]["rh"]}'),
                const SizedBox(width: 50),
                circularIndicatorWidget('${_weatherData!['data'][0]["rh"]}'),
                const SizedBox(width: 20),
              ],
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20),
            //   child: Text(
            //     'Temperature: ${_weatherData!['data'][0]['temp']}°C',
            //     style: const TextStyle(
            //         fontSize: 16,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10),
            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20),
            //   child: Text(
            //     'Description: ${_weatherData!['data'][0]['weather']['description']}',
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ),
            // SizedBox(height: 10,),
            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20),
            //   child: Text(
            //     'Icon Code: ${_weatherData!['data'][0]['weather']['icon']}',
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM, yyyy').format(now);
    return formattedDate;
  }
}

