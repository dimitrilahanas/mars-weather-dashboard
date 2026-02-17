import 'package:mars_weather_dashboard/models/data_model.dart';

class SolModel {
  final DataModel temperature;
  final DataModel season;
  final DataModel windDirection;
  final DataModel windSpeed;

  const SolModel({
    required this.temperature,
    required this.season,
    required this.windDirection,
    required this.windSpeed,
  });

  factory SolModel.fromJson(Map<String, dynamic> json) {
    return SolModel(
      temperature: DataModel.fromJson(json['temperature']),
      season: DataModel.fromJson(json['season']),
      windDirection: DataModel.fromJson(json['wind_direction']),
      windSpeed: DataModel.fromJson(json['wind_speed']),
    );
  }
}
