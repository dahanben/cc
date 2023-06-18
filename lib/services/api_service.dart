import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<Map<String, dynamic>> fetchCcQuestion() async {
    final response = await http.get(Uri.parse('http://localhost:8000/cc_question'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch question and answers. Error: ${response.statusCode}');
    }
  }
}
