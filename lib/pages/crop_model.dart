import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../services/model_api.dart';

class CropModel extends StatefulWidget {
  const CropModel({super.key});

  @override

  State<CropModel> createState() => _CropModelState();
}

class _CropModelState extends State<CropModel> {
  late TextEditingController nController;
  late TextEditingController pController;
  late TextEditingController kController;
  late TextEditingController tempController;
  late TextEditingController phController;
  late TextEditingController humidityController;
  late TextEditingController rainfallController;

  var data;
  late String url;
  String queryText = "Result: ";

  @override
  void initState() {
    super.initState();
    nController = TextEditingController();
    pController = TextEditingController();
    kController = TextEditingController();
    tempController = TextEditingController();
    phController = TextEditingController();
    humidityController = TextEditingController();
    rainfallController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const Text(
                'Enter the following value to get your crop recommendation:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextField(
                controller: nController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'N (Nitrogen)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child:  TextField(
                controller: pController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'P (Phosphorus)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child:  TextField(
                controller: kController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'K (Potassium)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextField(
                controller: tempController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Temperature (°C)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextField(
                controller: humidityController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Humidity',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextField(
                controller: phController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'pH',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextField(
                controller: rainfallController,
                decoration: const InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green), // Change the color as needed
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Rainfall (mm)',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            // Wrap the Text widget with a SingleChildScrollView
            SingleChildScrollView(
              child: Text(
                queryText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var apiUrl = Uri.http("10.0.2.2:5000", "/api");

                    var jsonData = {
                      "N": (nController.text),
                      "P": (pController.text),
                      "K": (kController.text),
                      "temperature": (tempController.text),
                      "humidity": (humidityController.text),
                      "ph": (phController.text),
                      "rainfall": (rainfallController.text),
                    };
                    //
                    print(jsonData);

                    // var jsonData = {
                    //   "N": 90,
                    //   "P": 42,
                    //   "K": 43,
                    //   "temp": 20.87974371,
                    //   "humidity": 82.00274423,
                    //   "ph": 6.502985292,
                    //   "rainfall": 202.9355362
                    // };

                    // String jsonString = jsonEncode(jsonData);



                    // var jsonData = {
                    //   "N": 90.toString(),
                    //   "P": 42.toString(),
                    //   "K": 43.toString(),
                    //   "temp": 20.toString(),
                    //   "humidity": 82.toString(),
                    //   "ph": 6.5.toString(),
                    //   "rainfall": 203.toString(),
                    // };
                    // print(jsonString);


                    // var response = await http.post(apiUrl, body: jsonData);
                    var response = await http.post(
                      apiUrl,
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode(jsonData),
                    );

                    if (response.statusCode == 200) {
                      var dataJson = jsonDecode(response.body);
                      setState(() {
                        queryText = "Result: ${dataJson['prediction']}";
                        print(queryText);
                      });
                    } else {
                      print('Error Response Body: ${response.body}');
                      throw Exception('Failed to load data: ${response.statusCode}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Get data'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
