import 'package:http/http.dart' as http;

Future<String> Getdata(Uri url) async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}
