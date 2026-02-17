import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpServices {
  String baseUrl = "http://localhost:8000";

  Future<List<String>> getSols() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/available"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List<dynamic> sols = data['available_sols'];

        return sols.map((sol) => sol.toString()).toList();
      } else {
        throw Exception("Failed to load sols");
      }
    } catch (err) {
      print(err);
      return [];
    }
  }
}