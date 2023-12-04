import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/model_api.dart';

class CropModel extends StatefulWidget {
  const CropModel({super.key});

  @override
  State<CropModel> createState() => _CropModelState();
}

class _CropModelState extends State<CropModel> {
  var data;
  late String url;
  String QueryText = "Result: ";

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
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
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
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
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
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
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
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
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
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
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
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Change the color as needed
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
                QueryText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
                  data = await Getdata(url);
                  var dataJson = jsonDecode(data);
                  setState(() {
                    QueryText = dataJson['Query'];
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Get data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
