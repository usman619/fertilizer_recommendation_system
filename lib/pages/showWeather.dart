import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/weatherBit_api.dart';
import '../widgets/weather_widgets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherBitApi _weatherBitApi = WeatherBitApi();
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

  Future<void> _refreshWeatherData() async {
    await _loadWeatherData();
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
      body: RefreshIndicator(
        onRefresh: _refreshWeatherData,
        child: Align(
          alignment: Alignment.topLeft,
          child: _weatherData == null
              ? const Center(child: CircularProgressIndicator())
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
                    const SizedBox(
                      height: 15,
                    ),
                    tempeatureAreaWidget(
                      '${_weatherData!['data'][0]['weather']['icon']}',
                      '${_weatherData!['data'][0]['weather']['description']}',
                      '${_weatherData!['data'][0]['temp']}',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          circularIndicatorWidget(
                              '${_weatherData!['data'][0]["rh"]}'),
                          const SizedBox(width: 60),
                          circularIndicatorWidget(
                              '${_weatherData!['data'][0]["rh"]}'),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ],
                ),
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
