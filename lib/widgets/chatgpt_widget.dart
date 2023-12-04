import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// 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
// 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

class ChatGPTResponseContainer extends StatefulWidget {
  const ChatGPTResponseContainer({super.key, required this.prompt});

  final String prompt;

  @override
  _ChatGPTResponseContainerState createState() => _ChatGPTResponseContainerState();
}

class _ChatGPTResponseContainerState extends State<ChatGPTResponseContainer> {
  String chatGPTResponse = '';
  final RateLimiter rateLimiter = RateLimiter(2000); // 1000 milliseconds (1 second) delay

  Future<void> fetchChatGPTResponse() async {
    final endpoint = 'https://api.openai.com/v1/engines/davinci/completions';
    final apiKey = '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'; // Replace with your OpenAI API key

    final payload = {
      'prompt': widget.prompt,
      'temperature': 0.7,
      'max_tokens': 256,
      'top_p': 1.0,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    };

    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    await rateLimiter.throttle(); // Introduce a delay before making the request

    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      chatGPTResponse = responseData['choices'][0]['text'];
      setState(() {});
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchChatGPTResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[150],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(chatGPTResponse),
    );
  }
}

class RateLimiter {
  final int _delay;
  int _lastRequestTime = 0;

  RateLimiter(this._delay);

  Future<void> throttle() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final timeDifference = currentTime - _lastRequestTime;

    if (timeDifference < _delay) {
      await Future.delayed(Duration(milliseconds: _delay - timeDifference));
    }

    _lastRequestTime = DateTime.now().millisecondsSinceEpoch;
  }
}


//
// class ChatGPTResponseContainer extends StatefulWidget {
//   const ChatGPTResponseContainer({Key? key, required this.prompt}) : super(key: key);
//
//   final String prompt;
//
//   @override
//   _ChatGPTResponseContainerState createState() => _ChatGPTResponseContainerState();
// }
//
// class _ChatGPTResponseContainerState extends State<ChatGPTResponseContainer> {
//   String chatGPTResponse = '';
//
//   Future<void> fetchChatGPTResponse() async {
//     final endpoint = 'https://api.openai.com/v1/engines/davinci/completions';
//     final apiKey = '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'; // Replace with your OpenAI API key
//
//     final payload = {
//       'prompt': widget.prompt,
//       'temperature': 0.7,
//       'max_tokens': 256,
//       'top_p': 1.0,
//       'frequency_penalty': 0.0,
//       'presence_penalty': 0.0,
//     };
//
//     final headers = {
//       'Authorization': 'Bearer $apiKey',
//       'Content-Type': 'application/json',
//     };
//
//     final response = await http.post(
//       Uri.parse(endpoint),
//       headers: headers,
//       body: jsonEncode(payload),
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);
//       chatGPTResponse = responseData['choices'][0]['text'];
//       setState(() {});
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchChatGPTResponse();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       margin: const EdgeInsets.symmetric(vertical: 4.0),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Text(chatGPTResponse),
//     );
//   }
// }





// class GptResponseWidget extends StatefulWidget {
//   final String prompt;
//
//   GptResponseWidget({required this.prompt});
//
//   @override
//   _GptResponseWidgetState createState() => _GptResponseWidgetState();
// }
//
// class _GptResponseWidgetState extends State<GptResponseWidget> {
//   final OpenAIAPI openAIAPI = OpenAIAPI('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');
//   late Future<String> result;
//
//   @override
//   void initState() {
//     super.initState();
//     result = getResult();
//   }
//
//   Future<String> getResult() async {
//     try {
//       final generatedText = await openAIAPI.generateText(widget.prompt);
//       print('API Response: $generatedText');
//       return generatedText;
//     } catch (e) {
//       print('Error generating text: $e');
//       throw Exception('Failed to generate text');
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: result,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // While waiting for the result, you can show a loading indicator or placeholder.
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Use the result to determine the container size.
//           final response = snapshot.data!;
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             margin: const EdgeInsets.all(5.0),
//             padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
//             child: Column(
//               children: [
//                 const Text('AI Response:'),
//                 Text(response),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// Widget gptResponse() {
//   final OpenAIAPI openAIAPI =
//       OpenAIAPI('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');
//
//   Future<String> getResult() async {
//     final generatedText =
//     await openAIAPI.generateText('Your prompt here');
//     return generatedText;
//   }
//
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.grey.shade300,
//       borderRadius: BorderRadius.circular(20.0),
//     ),
//     margin: const EdgeInsets.all(5.0),
//     padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
//     child: Column(
//
//         children: [
//       const Text('AI Response:'),
//       Text(getResult() as String)
//
//     ]),
//   );
// }
