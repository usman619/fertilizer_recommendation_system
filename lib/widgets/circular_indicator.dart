import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


Widget circularIndicator(String title, String symbol, var value) {

  String view = value.toString() + symbol;
  double percent = value.toDouble() / 100.0;

  return Container(
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),  // Shadow color
          spreadRadius: 2,                      // Spread radius
          blurRadius: 5,                        // Blur radius
          offset: const Offset(0, 3),           // Offset in the x,y direction
        ),
      ],

    ),

    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 3.0,
            child: CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 8.0,
              percent: percent,
              center: Text(
                view,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              progressColor: Colors.blue,
            ),
          ),
          const SizedBox(height: 3.0),
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    ),
  );
}
