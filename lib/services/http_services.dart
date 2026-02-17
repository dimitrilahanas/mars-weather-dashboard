import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mars_weather_dashboard/models/sol_model.dart';
import 'package:mars_weather_dashboard/models/data_model.dart';

class HttpServices {
  String baseUrl = "http://localhost:8000";

  Future<List<int>> getAvailableSols() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/available"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<dynamic> sols = data['available_sols'];
        return sols.map<int>((s) => int.parse(s.toString())).toList();
      } else {
        throw Exception("Failed to load available sols");
      }
    } catch (err) {
      print(err);
      return [];
    }
  }

  Future<SolModel?> getSol(int solNumber) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$solNumber"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        DataModel wrap(dynamic value, String label) {
          return DataModel(label: label, data: value?.toString() ?? "-");
        }

        return SolModel(
          solNumber: solNumber,
          temperature: wrap(data['temperature'], "Temperature"),
          season: wrap(data['season'], "Season"),
          windDirection: wrap(data['wind_direction'], "Wind Direction"),
          windSpeed: wrap(data['wind_speed'], "Wind Speed"),
        );
      } else {
        throw Exception("Failed to load sol $solNumber");
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
