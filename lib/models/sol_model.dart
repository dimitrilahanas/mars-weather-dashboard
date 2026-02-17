import 'package:mars_weather_dashboard/models/data_model.dart';

class SolModel {
  final int solNumber;
  final DataModel temperature;
  final DataModel season;
  final DataModel windDirection;
  final DataModel windSpeed;

  const SolModel({
    required this.solNumber,
    required this.temperature,
    required this.season,
    required this.windDirection,
    required this.windSpeed,
  });

  factory SolModel.fromJson(Map<String, dynamic> json) {
    DataModel wrap(dynamic value, String label) {
      return DataModel(label: label, data: value.toString());
    }

    return SolModel(
      solNumber: json['sol_number'] ?? 0,
      temperature: wrap(json['temperature'], "Temperature"),
      season: wrap(json['season'], "Season"),
      windDirection: wrap(json['wind_direction'], "Wind Direction"),
      windSpeed: wrap(json['wind_speed'], "Wind Speed"),
    );
  }
}
