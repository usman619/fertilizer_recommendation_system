import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/model_api.dart';

class FertilizerModel extends StatefulWidget {
  const FertilizerModel({super.key});

  @override
  State<FertilizerModel> createState() => _FertilizerModelState();
}

class _FertilizerModelState extends State<FertilizerModel> {
  late TextEditingController nController;
  late TextEditingController pController;
  late TextEditingController kController;
  late TextEditingController cropController;

  var data;
  late String url;
  String queryText = "Result: ";

  @override
  void initState() {
    super.initState();
    nController = TextEditingController();
    pController = TextEditingController();
    kController = TextEditingController();
    cropController = TextEditingController();

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
                'Get advice relate to fertilizer based on soil:',
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
                  labelText: 'Crop',
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
              child: ElevatedButton(
                onPressed: () async {
                  var url = Uri.http("10.0.2.2:5000", "/fertilizer", {"Query": "my name is usman"});
                  data = await Getdata(url);
                  var dataJson = jsonDecode(data);
                  setState(() {
                    queryText = dataJson['Query'];
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
