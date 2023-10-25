// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fertilizer_recommendation_system/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fertilizer_recommendation_system/services/get_sensors_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:fertilizer_recommendation_system/pages/models.dart';
import 'package:fertilizer_recommendation_system/services/model_api.dart';
import 'package:http/testing.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:fertilizer_recommendation_system/widgets/circular_indicator.dart'; // Replace with your import path
import 'package:fertilizer_recommendation_system/main.dart'; // Replace with your import path

void main() {
  group('GetSensorsData Widget Tests', () {
    testWidgets('Widget Renders Without Errors', (WidgetTester tester) async {
      // Build the GetSensorsData widget
      await tester.pumpWidget(MaterialApp(home: GetSensorsData()));

      // Verify that the widget is rendered without errors
      expect(find.byType(GetSensorsData), findsOneWidget);
    });

    testWidgets('Moisture Data Display Test', (WidgetTester tester) async {
      // Build the GetSensorsData widget with a specific moistureData value
      await tester.pumpWidget(MaterialApp(
        home: GetSensorsData(),
      ));

      // Verify that the moisture data is displayed correctly
      expect(find.text('Moisture Data: YourTestData'), findsOneWidget);
    });
  });

  group('IoTDevice Widget Tests', () {
    testWidgets('Widget Renders Without Errors', (WidgetTester tester) async {
      // Build the IoTDevice widget
      await tester.pumpWidget(MaterialApp(home: IoTDevice('YourTestData')));

      // Verify that the widget is rendered without errors
      expect(find.byType(IoTDevice as Type), findsOneWidget);
    });

    testWidgets('Moisture Data Display Test', (WidgetTester tester) async {
      // Build the IoTDevice widget with a specific moistureData value
      await tester.pumpWidget(MaterialApp(
        home: IoTDevice('YourTestData'),
      ));

      // Verify that the moisture data is displayed correctly
      expect(find.text('Moisture Data: YourTestData'), findsOneWidget);
    });
  });

  // More
  // group('Models Widget Tests', () {
  //   testWidgets('Widget Renders Without Errors', (WidgetTester tester) async {
  //     await tester.pumpWidget(MaterialApp(home: Models()));
  //     expect(find.byType(Models), findsOneWidget);
  //   });
  //
  //   testWidgets('Button Click Fetches Data', (WidgetTester tester) async {
  //     final client = MockClient();
  //
  //     final url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
  //     final responseData = {'Query': 'Mocked response'};
  //
  //     // Mock the HTTP response using http_mock_adapter
  //     client.onGet(url).reply(200, jsonEncode(responseData));
  //
  //     // Replace the real client with the mock client
  //     setMockClientFor(http.Client(), client);
  //
  //     await tester.pumpWidget(MaterialApp(home: Models()));
  //
  //     final button = find.byType(ElevatedButton);
  //     expect(button, findsOneWidget);
  //
  //     await tester.tap(button);
  //     await tester.pump();
  //
  //     final queryText = find.text('Result: Mocked response');
  //     expect(queryText, findsOneWidget);
  //   });
  // });
  //
  // group('Getdata Function Tests', () {
  //   test('Getdata Function Returns Data', () async {
  //     final client = MockClient();
  //
  //     final url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
  //     final responseData = {'Query': 'Mocked response'};
  //
  //     // Mock the HTTP response using http_mock_adapter
  //     client.onGet(url).reply(200, jsonEncode(responseData));
  //
  //     // Replace the real client with the mock client
  //     setMockClientFor(http.Client(), client);
  //
  //     final result = await Getdata(url);
  //     expect(result, jsonEncode(responseData));
  //   });
  //
  //   test('Getdata Function Handles Error', () async {
  //     final client = MockClient();
  //
  //     final url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
  //
  //     // Mock the HTTP response to simulate an error
  //     client.onGet(url).reply(500, 'Server Error');
  //
  //     // Replace the real client with the mock client
  //     setMockClientFor(http.Client(), client);
  //
  //     try {
  //       await Getdata(url);
  //     } catch (e) {
  //       expect(e.toString(), 'Exception: Failed to load data: 500');
  //     }
  //   });
  // });
  // group('Models Widget Tests', () {
  //   testWidgets('Widget Renders Without Errors', (WidgetTester tester) async {
  //     await tester.pumpWidget(MaterialApp(home: Models()));
  //     expect(find.byType(Models), findsOneWidget);
  //   });
  //
  //   testWidgets('Button Click Fetches Data', (WidgetTester tester) async {
  //     // Mock the HTTP response when the button is clicked
  //     final url = Uri.http("192.168.10.82:5000", "/api", {"Query": "my name is usman"});
  //     final responseData = {'Query': 'Mocked response'};
  //     final response = http.Response(jsonEncode(responseData), 200);
  //     http.Client().defaultResponse = response;
  //
  //     await tester.pumpWidget(MaterialApp(home: Models()));
  //
  //     final button = find.byType(ElevatedButton);
  //     expect(button, findsOneWidget);
  //
  //     await tester.tap(button);
  //     await tester.pump();
  //
  //     final queryText = find.text('Result: Mocked response');
  //     expect(queryText, findsOneWidget);
  //   });
  // });
  //
  // group('Getdata Function Tests', () {
  //   test('Getdata Function Returns Data', () async {
  //     var url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
  //     final responseData = {'Query': 'Mocked response'};
  //     final response = http.Response(jsonEncode(responseData), 200);
  //     http.Client().defaultResponse = response;
  //
  //     final result = await Getdata(url);
  //     expect(result, jsonEncode(responseData));
  //   });
  //
  //   test('Getdata Function Handles Error', () async {
  //     var url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
  //     final response = http.Response('Server Error', 500);
  //     http.Client().defaultResponse = response;
  //
  //     try {
  //       await Getdata(url);
  //     } catch (e) {
  //       expect(e.toString(), 'Exception: Failed to load data: 500');
  //     }
  //   });
  // });
}

