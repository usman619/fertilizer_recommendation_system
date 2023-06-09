import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/model_api.dart';

class Models extends StatefulWidget {
  const Models({super.key});

  @override
  State<Models> createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
  var data;
  late String url;
  String QueryText = "Result: ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Testing Python Connection'),
          centerTitle: true,

        ),
        body: Column(
          children: <Widget>[
            Text(
              QueryText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var url = Uri.http("192.168.10.82:5000", "/api", {"Query": "my name is usman"});
                  data = await Getdata(url);
                  var dataJson = jsonDecode(data);
                  setState(() {
                    QueryText = dataJson['Query'];
                  });
                },
                child: const Text('Get data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),

            )
          ],
        ),
      );

  }
}

