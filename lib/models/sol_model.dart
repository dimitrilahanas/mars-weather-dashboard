import 'package:mars_weather_dashboard/models/data_model.dart';

class SolModel {
  final String sol;
  final DataModel temperature;
  final DataModel season;
  final DataModel windDirection;
  final DataModel windSpeed;

  const SolModel({
    required this.sol,
    required this.temperature,
    required this.season,
    required this.windDirection,
    required this.windSpeed,
  });
}
