// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/testing.dart';
// import 'package:fertilizer_recommendation_system/pages/models.dart'; // Replace with your import path
// import 'package:fertilizer_recommendation_system/services/model_api.dart'; // Replace with your import path
// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// void main() {
//   group('Models Widget Tests', () {
//     testWidgets('Widget Renders Without Errors', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(home: Models()));
//       expect(find.byType(Models), findsOneWidget);
//     });
//
//     testWidgets('Button Click Fetches Data', (WidgetTester tester) async {
//       final mockClient = MockClient((request) async {
//         // Mock the HTTP response
//         final responseData = {'Query': 'Mocked response'};
//         return http.Response(jsonEncode(responseData), 200);
//       });
//
//       final Models models = Models();
//
//       final url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
//
//       await tester.pumpWidget(MaterialApp(home: models));
//
//       final button = find.byType(ElevatedButton);
//       expect(button, findsOneWidget);
//
//       await tester.tap(button);
//       await tester.pump();
//
//       final queryText = find.text('Result: Mocked response');
//       expect(queryText, findsOneWidget);
//     });
//   });
//
//   group('Getdata Function Tests', () {
//     test('Getdata Function Returns Data', () async {
//       final mockClient = MockClient((request) async {
//         // Mock the HTTP response to return data
//         final responseData = {'Query': 'Mocked response'};
//         return http.Response(jsonEncode(responseData), 200);
//       });
//
//       final url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
//
//       final result = await Getdata(url,);
//       expect(result, 0);
//     });
//
//     test('Getdata Function Handles Error', () async {
//       final mockClient = MockClient((request) async {
//         // Mock the HTTP response to simulate an error
//         return http.Response('Server Error', 500);
//       });
//
//       final url = Uri.http("10.0.2.2:5000", "/api", {"Query": "my name is usman"});
//
//       try {
//         await Getdata(url);
//       } catch (e) {
//         expect(e.toString(), 'Exception: Failed to load data: 500');
//       }
//     });
//   });
// }