import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import '../widgets/circular_indicator.dart';

class GetSensorsData extends StatefulWidget {
  @override
  _GetSensorsDataState createState() => _GetSensorsDataState();
}

class _GetSensorsDataState extends State<GetSensorsData> {
  // Define a variable to store the fetched data
  dynamic moistureData;

  // Create a reference to the Firebase database path
  final databaseReference = FirebaseDatabase.instance.reference().child('UsersData/W4lhOJzc4CSBIStyLLdW4n2mnbI2/readings');

  @override
  void initState() {
    super.initState();
    // Initialize Firebase
    Firebase.initializeApp();
    // Fetch the data when the screen is initialized
    fetchData();
  }

// Method to fetch the data from the Firebase Realtime Database
  void fetchData() {
    databaseReference.limitToLast(1).once().then((DatabaseEvent event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          final latestEntry = snapshot.value as Map<dynamic, dynamic>;
          if (latestEntry.isNotEmpty) {
            final latestData = latestEntry.entries.last.value as Map<dynamic, dynamic>;
            moistureData = latestData['moisture'] ?? 'N/A';
          }
        });
      }
    }, onError: (error) {
      print('Error fetching data: $error');
    });
  }




  @override
  Widget build(BuildContext context) {
    return Center(
        child: moistureData != null
            ? IoTDevice(moistureData)
            : CircularProgressIndicator(),
      );
  }
}


Widget IoTDevice(String moistureData) {
  return Container(
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5.0),
          Text(
              'Moisture Data: $moistureData',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    ),
  );
}

